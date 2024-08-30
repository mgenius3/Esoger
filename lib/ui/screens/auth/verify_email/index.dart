import 'package:esoger/ui/theme/colors.dart';
import 'package:flutter/material.dart';
import 'package:esoger/ui/widget/button/back_navigation.dart';
import 'package:esoger/ui/widget/button/primarybutton.dart';
import 'package:esoger/utils/validators.dart';
import 'package:go_router/go_router.dart'; // Import the validators.dart file

class VerifyEmail extends StatefulWidget {
  const VerifyEmail({super.key});

  @override
  State<VerifyEmail> createState() => _VerifyEmailState();
}

class _VerifyEmailState extends State<VerifyEmail> {
  final _emailTextController = TextEditingController();
  final _emailFocusNode = FocusNode();
  final _formKey = GlobalKey<FormState>();
  bool _isEmailFieldFocused = false;
  bool _isFormValid = false;

  @override
  void initState() {
    super.initState();
    _emailFocusNode.addListener(_onFocusChange);
  }

  void _onFocusChange() {
    setState(() {
      _isEmailFieldFocused = _emailFocusNode.hasFocus;
    });
  }

  void _validateForm() {
    setState(() {
      _isFormValid = _formKey.currentState?.validate() ?? false;
    });
  }

  @override
  void dispose() {
    _emailFocusNode.removeListener(_onFocusChange);
    _emailFocusNode.dispose();
    _emailTextController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 40),
          child: Form(
            key: _formKey,
            onChanged: _validateForm,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [backNavigation(context)],
                ),
                const SizedBox(height: 100),
                if (!_isEmailFieldFocused)
                  Center(
                    child:
                        Image.asset('public/images/verify_email/mailbox.png'),
                  ),
                const SizedBox(height: 30),
                const Text(
                  "Verify your email",
                  style: TextStyle(
                      fontFamily: "Work Sans",
                      fontSize: 26,
                      fontWeight: FontWeight.w600),
                ),
                const SizedBox(height: 20),
                TextFormField(
                  focusNode: _emailFocusNode,
                  controller: _emailTextController,
                  decoration: const InputDecoration(
                    labelText: 'Email address',
                    prefixIcon: Icon(Icons.email_outlined),
                    border:
                        OutlineInputBorder(), // Set the border to a rectangular shape
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter your email address';
                    }
                    if (!Validators.emailRegExp.hasMatch(value)) {
                      return 'Please enter a valid email address';
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 100),
                _isFormValid
                    ? CustomPrimaryButton(
                        onPressed: () {
                          context.push(
                              "/verifyemail/${_emailTextController.text}");
                        },
                        child: const Text(
                          "Continue",
                          style: TextStyle(
                            color: Colors.white,
                          ),
                        ),
                      )
                    : CustomPrimaryButton(
                        color: secondaryColor,
                        onPressed: () {},
                        child: const Text(
                          "Continue",
                          style: TextStyle(
                            color: Colors.white,
                          ),
                        ),
                      )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
