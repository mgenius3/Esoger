import 'package:flutter/material.dart';
import 'package:esoger/ui/widget/button/primarybutton.dart';
import 'package:esoger/ui/theme/colors.dart';
import "package:go_router/go_router.dart";

void showAlertDialog(BuildContext context,
    {required List<Widget> children, String? routes, String? buttontext}) {
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        shape:
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(20.0)),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            ...children.toList(),
            const SizedBox(height: 20),
            CustomPrimaryButton(
              onPressed: () {
                if (routes != null) {
                  context.go('/$routes');
                } else {
                  context.pop();
                }
              },
              child: Text(
                buttontext != null ? buttontext : "OK",
                style: TextStyle(color: Colors.white),
              ),
              color: secondaryColor,
            )
          ],
        ),
      );
    },
  );
}
