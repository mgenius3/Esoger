import 'package:esoger/ui/widget/button/back_navigation.dart';
import 'package:flutter/material.dart';
import 'package:esoger/ui/theme/colors.dart';
import 'package:esoger/ui/widget/button/primarybutton.dart';
import 'package:go_router/go_router.dart';

class SetNewPassword extends StatefulWidget {
  const SetNewPassword({super.key});

  @override
  State<SetNewPassword> createState() => _SetNewPasswordState();
}

class _SetNewPasswordState extends State<SetNewPassword> {
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
                  Row(
                    children: [
                      backNavigation(context),
                      const SizedBox(width: 10),
                      const Text(
                        "Set New Password",
                        style: TextStyle(fontSize: 19),
                      ),
                    ],
                  ),
                  const SizedBox(height: 30),
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
                      border: const OutlineInputBorder(),
                    ),
                    onChanged: (text) => setState(() {
                      _passwordTextController.text = text;
                    }),
                  ),
                  const SizedBox(height: 20),
                  TextFormField(
                    obscureText: !_isPasswordVisible,
                    decoration: InputDecoration(
                      labelText: 'Confirm Password',
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
                  const SizedBox(height: 30.0),
                  CustomPrimaryButton(
                    onPressed: () {
                      context.push("/profile");
                    },
                    child: const Text(
                      "Set New Password",
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
