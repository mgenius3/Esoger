import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

Widget header() {
  return (Container(
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          children: [
            SizedBox(child: Image.asset('public/images/avatar.png')),
            const SizedBox(width: 10),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                const Text('Hi Moses',
                    style: TextStyle(
                        fontFamily: "Work Sans",
                        fontSize: 20,
                        fontWeight: FontWeight.w700)),
                Text(
                  'Find your lesson today',
                  style: TextStyle(
                      fontSize: 14,
                      fontFamily: "Work Sans",
                      fontWeight: FontWeight.w500,
                      color: Color(0XFF8C8C8C)),
                )
              ],
            )
          ],
        ),
        Container(
          decoration: const BoxDecoration(
              color: Colors
                  .white, // You can set the background color of the container
              boxShadow: [
                BoxShadow(
                  color: Color(0x05132C4A), // Convert the color to ARGB format
                  offset: Offset(0, 6), // Horizontal and vertical offset
                  blurRadius: 16, // The blur radius
                  spreadRadius: 0, // The spread radius
                ),
              ]),
          child: SvgPicture.asset('public/svg/notification.svg'),
        )
      ],
    ),
  ));
}
