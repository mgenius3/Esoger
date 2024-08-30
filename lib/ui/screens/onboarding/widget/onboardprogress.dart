import 'package:flutter/material.dart';
import 'package:esoger/ui/theme/colors.dart';
import 'package:go_router/go_router.dart';

Widget progressLoading(int position) {
  return Row(
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    children: [
      Container(
        padding: EdgeInsets.symmetric(
            vertical: 4, horizontal: position == 0 ? 14 : 4),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(30),
            border: Border.all(color: primaryColor),
            color: position == 0 ? primaryColor : Colors.white),
      ),
      const SizedBox(width: 5),
      Container(
        padding: EdgeInsets.symmetric(
            vertical: 4, horizontal: position == 1 ? 14 : 4),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(30),
            border: Border.all(color: primaryColor),
            color: position == 1 ? primaryColor : Colors.white),
      ),
    ],
  );
}
