import 'package:flutter/material.dart';
import 'dart:async';
import "package:esoger/ui/theme/colors.dart";
import 'package:go_router/go_router.dart';
import 'package:esoger/ui/theme/index.dart';

class Splash extends StatefulWidget {
  const Splash({Key? key}) : super(key: key);
  @override
  _SplashState createState() => _SplashState();
}

class _SplashState extends State<Splash> {
  startTimer() {
    Timer(const Duration(seconds: 3), () async {
      context.go('/splash1');
    });
  }

  @override
  void initState() {
    super.initState();
    startTimer();
  }

  @override
  Widget build(BuildContext context) {
    final backgroundGradient = Container(
      decoration: BoxDecoration(
          gradient: LinearGradient(
        begin: Alignment.topCenter, // Direction is bottom to top
        end: Alignment.bottomCenter,
        colors: [
          primaryColor, // Start color
          secondaryColor, // End color
        ],
        stops: [
          0.3676, // 36.76%
          1.0, // 100%
        ],
      )),
    );

    return Scaffold(
      resizeToAvoidBottomInset: false, // Prevent unnecessary resizing
      body: Stack(
        children: [
          backgroundGradient, // Use the container as the background
        ],
      ),
    );
  }
}
