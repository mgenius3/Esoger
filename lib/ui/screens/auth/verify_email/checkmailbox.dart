import 'package:esoger/ui/theme/colors.dart';
import 'package:flutter/material.dart';
import 'package:esoger/ui/widget/button/back_navigation.dart';
import 'package:esoger/ui/widget/button/primarybutton.dart';
import 'package:esoger/utils/validators.dart';
import 'package:go_router/go_router.dart'; // Import the validators.dart file

class CheckEmailBox extends StatefulWidget {
  final String email;
  const CheckEmailBox({super.key, required this.email});

  @override
  State<CheckEmailBox> createState() => _CheckEmailBoxState();
}

class _CheckEmailBoxState extends State<CheckEmailBox> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 40),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [backNavigation(context)],
              ),
              const SizedBox(height: 100),
              Center(
                child:
                    Image.asset('public/images/verify_email/emailverify.png'),
              ),
              const SizedBox(height: 30),
              const Text(
                "Verify your email",
                style: TextStyle(
                    fontSize: 26,
                    fontWeight: FontWeight.w600,
                    fontFamily: "Work Sans",
                    color: Color(0XFF494949)),
              ),
              const SizedBox(height: 20),
              const Text(
                "Please check our inbox and tap the link in the\nemail we’ve just sent to:",
                style: TextStyle(
                    color: Color(0XFF333333), fontFamily: "Work Sans"),
              ),
              const SizedBox(height: 20),
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    widget.email,
                    style:
                        const TextStyle(color: Color(0XFF333333), fontSize: 16),
                  ),
                  GestureDetector(
                    onTap: () {
                      context.push("/verifyemail");
                    },
                    child: const Text(
                      "Resend it",
                      style: TextStyle(
                          fontFamily: "Work Sans",
                          color: primaryColor,
                          fontSize: 16),
                    ),
                  )
                ],
              ),
              const SizedBox(height: 100),
              CustomPrimaryButton(
                onPressed: () {
                  context.go("/home");
                },
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
    );
  }
}
