import 'package:flutter/material.dart';
import 'package:esoger/ui/theme/colors.dart';
import 'package:go_router/go_router.dart';

Widget buttonButton({required BuildContext context}) {
  double screenWidth = MediaQuery.of(context).size.width;
  return Container(
      margin: const EdgeInsets.symmetric(horizontal: 50),
      height: 50,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          MaterialButton(
            onPressed: () {
              context.push('/onboard2');
            },
            child: Container(
              width: screenWidth * 0.3,
              padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 10),
              decoration: BoxDecoration(
                  color: primaryColor, borderRadius: BorderRadius.circular(12)),
              child: const Text(
                "Get Started",
                style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.w500,
                    fontSize: 10),
              ),
            ),
          )
        ],
      ));
}
