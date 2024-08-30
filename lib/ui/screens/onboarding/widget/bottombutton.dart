import 'package:flutter/material.dart';
import 'package:esoger/ui/theme/colors.dart';
import 'package:go_router/go_router.dart';

Widget buttonButton({required BuildContext context}) {
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
              padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 15),
              decoration: BoxDecoration(
                  color: primaryColor, borderRadius: BorderRadius.circular(12)),
              child: const Text(
                "Get Started",
                style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.w500,
                    fontSize: 16),
              ),
            ),
          )
        ],
      ));
}
