import 'package:flutter/material.dart';
import "package:esoger/ui/theme/colors.dart";
import './widget/onboardprogress.dart';
import './widget/bottombutton.dart';
import 'dart:async';
import 'package:go_router/go_router.dart';

class Onboard extends StatefulWidget {
  const Onboard({Key? key}) : super(key: key);
  @override
  _OnboardState createState() => _OnboardState();
}

class _OnboardState extends State<Onboard> {
  startTimer() {
    Timer(const Duration(seconds: 3), () async {
      context.go('/onboard1');
    });
  }

  @override
  void initState() {
    super.initState();
    startTimer();
  }

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;

    return Scaffold(
        resizeToAvoidBottomInset: false, // Prevent unnecessary resizing
        backgroundColor: Color(0XFFFDF0EC),
        body: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                padding: const EdgeInsets.only(top: 50),
                height: height * 0.5,
                child: Image.asset(
                    'public/images/onboarding/worker-with-hammer.png'),
              ),
              const SizedBox(height: 20),
              Container(
                height: height * 0.5,
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(25)),
                padding: const EdgeInsets.only(left: 40, top: 50),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      width: width * 0.9,
                      child: RichText(
                          text: const TextSpan(children: [
                        TextSpan(
                            text: "Checkout our ",
                            style: TextStyle(
                                fontSize: 32, color: Color(0XFF3F3F40))),
                        TextSpan(
                            text: "Standard ",
                            style:
                                TextStyle(fontSize: 32, color: primaryColor)),
                        TextSpan(
                            text: "Equipment Design",
                            style: TextStyle(
                                fontSize: 32, color: Color(0XFF3F3F40))),
                      ])),
                    ),
                    const SizedBox(height: 20),
                    const Text(
                        "The complete App to get high quality Design Equipment",
                        style: TextStyle(
                            color: Color(0XFF1B163F),
                            fontWeight: FontWeight.w300,
                            height: 2,
                            fontSize: 12)),
                    const SizedBox(height: 50),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        SizedBox(
                          width: 50,
                          child: progressLoading(0),
                        ),
                        buttonButton(context: context),
                      ],
                    )
                  ],
                ),
              )
            ],
          ),
        ));
  }
}
