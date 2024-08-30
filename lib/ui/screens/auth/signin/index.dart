import 'package:flutter/material.dart';
import 'package:esoger/ui/theme/colors.dart';
import 'package:esoger/ui/widget/button/primarybutton.dart';
import 'package:go_router/go_router.dart';
import './widget/password_reset_by.dart';

class SignIn extends StatefulWidget {
  const SignIn({super.key});

  @override
  State<SignIn> createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  bool _showPasswordReset = false;
  bool _isPasswordVisible = false;
  final _emailTextController = TextEditingController();
  final _passwordTextController = TextEditingController();
  bool _isChecked = false;

  void _toggleCheckbox(bool? value) {
    setState(() {
      _isChecked = value ?? false;
    });
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
                    decoration: const InputDecoration(
                      labelText: 'Email address',
                      prefixIcon: Icon(Icons.email_outlined),
                      border: OutlineInputBorder(),
                    ),
                    onChanged: (text) => setState(() {
                      _emailTextController.text = text;
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
                      border: OutlineInputBorder(),
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
                    onPressed: () {
                      context.push("/home");
                    },
                    child: const Text(
                      "Sign In",
                      style: TextStyle(
                        color: Colors.white,
                        fontFamily: "Work Sans",
                      ),
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
                  CustomPrimaryButton(
                    onPressed: () {},
                    color: Colors.white,
                    border: true,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Image.asset(
                          'public/images/Google.png',
                          width: 40,
                        ),
                        const Text(
                          "Sign In with Google",
                          style: TextStyle(color: primaryColor),
                        ),
                      ],
                    ),
                  ),
                ],
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
