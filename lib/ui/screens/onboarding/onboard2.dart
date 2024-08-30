import 'package:flutter/material.dart';
import 'package:esoger/ui/theme/colors.dart';
import 'package:esoger/ui/widget/button/primarybutton.dart';
import 'package:go_router/go_router.dart';

class Onboard2 extends StatefulWidget {
  const Onboard2({super.key});

  @override
  State<Onboard2> createState() => _Onboard2State();
}

class _Onboard2State extends State<Onboard2> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SingleChildScrollView(
      child: Container(
        padding: const EdgeInsets.all(20),
        margin: const EdgeInsets.symmetric(vertical: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image.asset("public/images/esoger_logo.png", width: 100),
            const SizedBox(height: 20),
            Image.asset("public/images/onboarding/appdisplay.png"),
            const SizedBox(height: 20),
            RichText(
                textAlign: TextAlign.center,
                text: const TextSpan(children: [
                  TextSpan(
                      text:
                          "Welcome to Esoger Process Engineering Design Interactive  ",
                      style: TextStyle(
                          fontFamily: "Work Sans",
                          fontSize: 24,
                          color: Color(0XFF3F3F40))),
                  TextSpan(
                      text: "Workbooks",
                      style: TextStyle(
                          fontFamily: "Work Sans",
                          fontSize: 24,
                          color: primaryColor)),
                ])),
            const SizedBox(height: 50),
            CustomPrimaryButton(
              onPressed: () {
                context.push("/signin");
              },
              text: "Login",
              textcolor: Colors.white,
            ),
            const SizedBox(height: 20),
            CustomPrimaryButton(
              onPressed: () {
                context.push('/signup');
              },
              color: Colors.white,
              text: "Sign Up",
              textcolor: primaryColor,
              border: true,
              bordercolor: primaryColor,
            )
          ],
        ),
      ),
    ));
  }
}
