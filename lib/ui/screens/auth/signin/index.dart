import 'package:esoger/utils/handle_error.dart';
import 'package:flutter/material.dart';
import 'package:esoger/ui/theme/colors.dart';
import 'package:esoger/ui/widget/button/primarybutton.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:go_router/go_router.dart';
import './widget/password_reset_by.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:esoger/services/api/api_service.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:esoger/models/profile.dart';
import 'package:esoger/provider/profile.dart';

class SignIn extends ConsumerStatefulWidget {
  const SignIn({super.key});

  @override
  ConsumerState<SignIn> createState() => _SignInState();
}

class _SignInState extends ConsumerState<SignIn> {
  bool _showPasswordReset = false;
  bool _isPasswordVisible = false;
  final _emailTextController = TextEditingController();
  final _passwordTextController = TextEditingController();
  bool _isChecked = false;
  final FlutterSecureStorage _secureStorage = FlutterSecureStorage();
  final _formKey = GlobalKey<FormState>();
  ApiService apiService = ApiService();
  bool _isLoading = false;
  bool checkIfInputFieldIsComplete = false;
  bool signInSuccessfully = false;
  bool showpassword = false;

  void _toggleCheckbox(bool? value) {
    setState(() {
      _isChecked = value ?? false;
    });
  }

  bool validateForm() {
    return _formKey.currentState!.validate();
  }

  Future<void> _loadEmail() async {
    String? storedEmail = await _secureStorage.read(key: 'email');
    if (storedEmail != null) {
      setState(() {
        _emailTextController.text = storedEmail;
        checkIfInputFieldIsComplete = validateForm();
      });
    }
  }

  void _submit(BuildContext context) async {
    if (validateForm()) {
      setState(() {
        _isLoading = true;
      });
      try {
        Map<String, dynamic> userDetails = {
          "email": _emailTextController.text.trim(),
          "password": _passwordTextController.text.trim(),
        };

        Map responseData = await apiService.post("login", userDetails);

        if (responseData["error"] != null) {
          // Handle error here
          throw CustomError(responseData['error']);
        } else {
          //storing user_id
          await _secureStorage.write(
              key: 'user_id', value: responseData['data']['user_id']);

          //storing email address
          await _secureStorage.write(
              key: 'email', value: _emailTextController.text.trim());
          //fetch details
          Map userdetails = await apiService
              .get('get_user?id=${responseData['data']['user_id']}');

          //save data to state
          var data = userdetails['data']['data'];
          print(userdetails);
          var userprofile = Profile.fromJson(data);

          //save user profile to provider
          ref.read(profileProvider.notifier).saveProfile(userprofile);
          await _secureStorage.write(
              key: 'email', value: _emailTextController.text.trim());
        }
      } catch (err) {
        Fluttertoast.showToast(msg: err.toString());
      } finally {
        setState(() {
          _isLoading = false;
        });
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          SingleChildScrollView(
            child: Container(
              margin: const EdgeInsets.only(top: 100),
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Form(
                key: _formKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Image.asset("public/images/esoger_logo.png", width: 100),
                    const SizedBox(height: 30.0),
                    const Text(
                      "Sign In",
                      style: TextStyle(
                          fontFamily: "Work Sans",
                          fontWeight: FontWeight.w700,
                          fontSize: 24),
                    ),
                    const SizedBox(height: 25.0),
                    TextFormField(
                      controller: _emailTextController,
                      decoration: const InputDecoration(
                        labelText: 'Email address',
                        prefixIcon: Icon(Icons.email_outlined),
                        border: OutlineInputBorder(),
                      ),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter your email address';
                        } else if (!RegExp(
                                r"^[a-zA-Z0-9.a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,4}$")
                            .hasMatch(value)) {
                          return 'Please enter a valid email address';
                        }
                        return null;
                      },
                      onChanged: (text) => setState(() {
                        _emailTextController.text = text;
                      }),
                    ),
                    const SizedBox(height: 20.0),
                    TextFormField(
                      obscureText: !_isPasswordVisible,
                      controller: _passwordTextController,
                      decoration: InputDecoration(
                        labelText: 'Password',
                        suffixIcon: IconButton(
                          icon: Icon(
                            _isPasswordVisible
                                ? Icons.visibility
                                : Icons.visibility_off,
                          ),
                          onPressed: () {
                            setState(() {
                              _isPasswordVisible = !_isPasswordVisible;
                            });
                          },
                        ),
                        border: const OutlineInputBorder(),
                      ),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter your password';
                        } else if (value.length < 6) {
                          return 'Password must be at least 6 characters long';
                        }
                        return null;
                      },
                      onChanged: (text) => setState(() {
                        _passwordTextController.text = text;
                      }),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            Checkbox(
                                value: _isChecked, onChanged: _toggleCheckbox),
                            const Text("Remember Password",
                                style: TextStyle(fontFamily: "Work Sans"))
                          ],
                        ),
                        GestureDetector(
                          onTap: () {
                            setState(() {
                              _showPasswordReset = true;
                            });
                          },
                          child: const Text(
                            "Forgot Password",
                            style: TextStyle(
                                fontFamily: "Work Sans",
                                fontWeight: FontWeight.w300,
                                color: Color(0XFFDC0F11)),
                          ),
                        )
                      ],
                    ),
                    const SizedBox(height: 30.0),
                    CustomPrimaryButton(
                      onPressed: _isLoading ? () {} : () => _submit(context),
                      color: primaryColor,
                      child: _isLoading
                          ? const SizedBox(
                              height: 20,
                              width: 20,
                              child: CircularProgressIndicator(
                                valueColor: AlwaysStoppedAnimation<Color>(
                                  Colors.white,
                                ),
                              ),
                            )
                          : const Text(
                              "Sign In",
                              style: TextStyle(color: Colors.white),
                            ),
                    ),
                    const SizedBox(height: 20.0),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text("Don't have an Account?"),
                        const SizedBox(width: 5.0),
                        GestureDetector(
                          onTap: () {
                            context.push('/signup');
                          },
                          child: const Text(
                            "Create Account",
                            style: TextStyle(color: primaryColor),
                          ),
                        )
                      ],
                    ),
                    const SizedBox(height: 30.0),
                  ],
                ),
              ),
            ),
          ),
          if (_showPasswordReset) ...[
            ModalBarrier(
              color: Colors.black.withOpacity(0.5),
              dismissible: false,
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: passwordReset(context),
            ),
          ],
        ],
      ),
    );
  }
}
