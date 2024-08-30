import 'package:flutter/material.dart';
import 'package:esoger/ui/widget/button/primarybutton.dart';
import 'package:go_router/go_router.dart';

class CreateLoginPassword extends StatefulWidget {
  const CreateLoginPassword({super.key});

  @override
  State<CreateLoginPassword> createState() => _CreateLoginPasswordState();
}

class _CreateLoginPasswordState extends State<CreateLoginPassword> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
      padding: const EdgeInsets.all(40),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset('public/images/check.png'),
          const SizedBox(height: 20),
          const Text(
            'Email Verification complete',
            style: TextStyle(fontSize: 24, color: Color(0XFF3C1415)),
          ),
          const SizedBox(height: 20),
          const Text(
            'Your email has been verified',
            style: TextStyle(fontSize: 13, color: Color(0XFF3C1415)),
          ),
          const SizedBox(height: 50),
          CustomPrimaryButton(
            onPressed: () {
              context.push('/home');
            },
            text: 'Continue',
            textcolor: Colors.white,
          )
        ],
      ),
    ));
  }
}
