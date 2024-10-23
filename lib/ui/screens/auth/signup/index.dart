import 'package:esoger/ui/theme/colors.dart';
import 'package:flutter/material.dart';
import 'package:esoger/ui/widget/button/primarybutton.dart';
import 'package:go_router/go_router.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:esoger/services/api/api_service.dart';

class SignUp extends StatefulWidget {
  const SignUp({super.key});

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  bool _isPasswordVisible = false;
  bool _isLoading = false;
  final _fullnameController = TextEditingController();
  final _emailController = TextEditingController();
  final _phoneController = TextEditingController();
  final _passwordTextController = TextEditingController();
  final _formkey = GlobalKey<FormState>();
  ApiService apiService = ApiService();

  bool _isChecked = false;

  void _toggleCheckbox(bool? value) {
    setState(() {
      _isChecked = value ?? false;
    });
  }

  bool validateForm() {
    return _formkey.currentState!.validate();
  }

  void _submit() async {
    setState(() {
      _isLoading = true;
    });
    if (validateForm()) {
      try {
        //payload: user_id, fullname, email, username, phone, plan, status, is_admin, password, date_joined
        Map<String, dynamic> userDetails = {
          "first_name": _fullnameController.text.trim(),
          "phone": _phoneController.text.trim(),
          "email": _emailController.text.trim(),
          "password": _passwordTextController.text.trim(),
        };

        Map responseData = await apiService.post("register", userDetails);

        if (responseData["error"] != null) {
          // throw CustomError('${responseData['error']}');
        } else {
          // toastSuccess(context, message: responseData['data']['message']);
        }
        context.push('/signin');
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
      body: SingleChildScrollView(
        child: Container(
          margin: const EdgeInsets.only(top: 100),
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Image.asset(
                "public/images/esoger_logo.png",
                width: 100,
              ),
              const SizedBox(height: 30.0),
              const Text(
                "Create New Account",
                style: TextStyle(
                    fontWeight: FontWeight.w700,
                    fontSize: 24,
                    fontFamily: "Work Sans"),
              ),
              const SizedBox(height: 25.0),
              TextFormField(
                decoration: const InputDecoration(
                  hintText: "benmos16@gmail.com",
                  labelText: 'Email',
                  border:
                      OutlineInputBorder(), // Set the border to a rectangular shape
                ),
                onChanged: (text) => setState(() {
                  _phoneController.text = text;
                }),
              ),
              const SizedBox(height: 20.0),
              TextFormField(
                decoration: const InputDecoration(
                  hintText: "Moses Benjamin",
                  labelText: 'Full Name',
                  border:
                      OutlineInputBorder(), // Set the border to a rectangular shape
                ),
                onChanged: (text) => setState(() {
                  _phoneController.text = text;
                }),
              ),
              const SizedBox(height: 20.0),
              TextFormField(
                decoration: const InputDecoration(
                  hintText: "08134460259",
                  labelText: 'Phone number',
                  border:
                      OutlineInputBorder(), // Set the border to a rectangular shape
                ),
                onChanged: (text) => setState(() {
                  _phoneController.text = text;
                }),
              ),
              const SizedBox(height: 20.0),
              TextFormField(
                obscureText: !_isPasswordVisible,
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
                  border:
                      OutlineInputBorder(), // Set the border to a rectangular shape
                ),
                onChanged: (text) => setState(() {
                  _passwordTextController.text = text;
                }),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      Checkbox(value: _isChecked, onChanged: _toggleCheckbox),
                      const Text(
                        "Remember Password",
                        style: TextStyle(fontFamily: "Work Sans"),
                      )
                    ],
                  ),
                ],
              ),
              const SizedBox(height: 30.0),
              CustomPrimaryButton(
                onPressed: () {
                  context.push("/verifyemail");
                },
                child: const Text(
                  "Create Account",
                  style:
                      TextStyle(color: Colors.white, fontFamily: "Work Sans"),
                ),
              ),
              SizedBox(
                  child: CustomPrimaryButton(
                onPressed: _isLoading ? () {} : () => _submit(),
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
                        "Submit",
                        style: TextStyle(color: Colors.white),
                      ),
              )),

              const SizedBox(height: 20.0),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text("Already have an Account"),
                  const SizedBox(width: 5.0),
                  GestureDetector(
                    onTap: () {
                      context.push('/signin');
                    },
                    child: const Text(
                      "Sign in",
                      style: TextStyle(
                          color: primaryColor, fontFamily: "Work Sans"),
                    ),
                  )
                ],
              ),
              // const SizedBox(height: 30.0),
              // CustomPrimaryButton(
              //     onPressed: () {},
              //     color: Colors.white,
              //     border: true,
              //     child: Row(
              //       mainAxisAlignment: MainAxisAlignment.center,
              //       children: [
              //         Image.asset(
              //           'public/images/Google.png',
              //           width: 40,
              //         ),
              //         const Text(
              //           "Sign Up with Google",
              //           style: TextStyle(
              //               color: primaryColor, fontFamily: "Work Sans"),
              //         ),
              //       ],
              //     )),
              Center(
                child: TextButton(
                    onPressed: () {
                      context.push('/policy');
                    },
                    child: const Text(
                      "By clicking sign up, you agree to our policy",
                      textAlign: TextAlign.center,
                      style: TextStyle(fontFamily: "Work Sans"),
                    )),
              )
            ],
          ),
        ),
      ),
    );
  }
}
