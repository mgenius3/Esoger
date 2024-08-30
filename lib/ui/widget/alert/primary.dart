import 'package:flutter/material.dart';

Widget primarySuccessAlert({required Widget child}) {
  return Container(
      decoration: BoxDecoration(
          color: Colors.white, borderRadius: BorderRadius.circular(41)),
      padding: const EdgeInsets.all(20),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Image.asset('public/images/checksuccessful.png'),
          const SizedBox(height: 20),
          child
        ],
      ));
}
