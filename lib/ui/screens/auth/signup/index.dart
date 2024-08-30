import 'package:esoger/ui/theme/colors.dart';
import 'package:flutter/material.dart';
import 'package:esoger/ui/widget/button/primarybutton.dart';
import 'package:go_router/go_router.dart';

class SignUp extends StatefulWidget {
  const SignUp({super.key});

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  bool _isPasswordVisible = false;
  final _fullnameController = TextEditingController();
  final _phoneController = TextEditingController();
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
                        "Remeber Password",
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
                        "Sign Up with Google",
                        style: TextStyle(
                            color: primaryColor, fontFamily: "Work Sans"),
                      ),
                    ],
                  )),
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
