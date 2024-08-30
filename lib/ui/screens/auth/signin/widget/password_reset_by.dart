import "package:flutter/material.dart";
import 'package:go_router/go_router.dart';

Widget passwordReset(BuildContext context) {
  double height = MediaQuery.of(context).size.height;
  return Container(
    height: 150,
    padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 20),
    decoration: const BoxDecoration(
        borderRadius: BorderRadius.only(
            topLeft: Radius.circular(20), topRight: Radius.circular(20)),
        color: Colors.white),
    child: Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Row(
              children: [
                Image.asset("public/images/forget_password/sms.png", width: 30),
                const SizedBox(width: 5),
                const Text("Password reset via SMS")
              ],
            ),
            GestureDetector(
              onTap: () {
                context.push('/forgotpassword/sms');
              },
              child: Image.asset(
                  'public/images/forget_password/forgetarrow.png',
                  width: 30),
            )
          ],
        ),
        const SizedBox(height: 20),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Row(
              children: [
                Image.asset("public/images/forget_password/mailbox.png",
                    width: 30),
                const SizedBox(width: 5),
                const Text("Password reset via Email")
              ],
            ),
            GestureDetector(
              onTap: () {
                context.push('/forgotpassword/email');
              },
              child: Image.asset(
                'public/images/forget_password/forgetarrow.png',
                width: 30,
              ),
            )
          ],
        ),
      ],
    ),
  );
}
