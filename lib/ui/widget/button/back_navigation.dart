import 'package:flutter/material.dart';

Widget backNavigation(
  BuildContext context,
) {
  return GestureDetector(
    onTap: () {
      Navigator.pop(context);
    },
    child: Container(
        width: 30,
        height: 30,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            border: Border.all(width: 1, color: Colors.white),
            color: Colors.white),
        child: const Center(
          child: Icon(
            Icons.arrow_back_ios,
            size: 20,
          ),
        )),
  );
}
