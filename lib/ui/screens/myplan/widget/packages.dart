import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

Widget myPlanPackages() {
  final Map data = {
    "name": "gold package",
    "note": "best deal",
    "price": "\$5",
    "price_note": "Per month",
    "no": 1
  };

  return Container(
    margin: const EdgeInsets.only(
        right: 10, top: 10), // Margin around each container
    padding: const EdgeInsets.all(10), // Margin around each container

    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(10),
      color: data['no'] == 1
          ? const Color(0XFF200802)
          : data['no'] == 2
              ? Colors.black
              : const Color(0XFF460909), // Different color for each container
    ),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: List.generate(data['no'], (i) {
                return Padding(
                  padding: const EdgeInsets.all(4.0),
                  child: SvgPicture.asset('public/svg/gold_badge.svg'),
                );
              }),
            ),
            const SizedBox(width: 25),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  data['name'].toString().toUpperCase(),
                  style: const TextStyle(
                      color: Colors.white,
                      fontSize: 14.88,
                      fontFamily: "Work Sans",
                      fontWeight: FontWeight.w700),
                ),
                const SizedBox(height: 5),
                Text(data['note'],
                    style: const TextStyle(
                        color: Colors.white,
                        fontSize: 10,
                        fontFamily: "Work Sans",
                        fontWeight: FontWeight.w300)),
                const SizedBox(height: 10),
                Text(data['price'].toString().toUpperCase(),
                    style: const TextStyle(
                        color: Color(0XFFEC6543),
                        fontSize: 26.73,
                        fontFamily: "Work Sans",
                        fontWeight: FontWeight.w700)),
                const SizedBox(height: 5),
                Text(data['price_note'].toString(),
                    style: const TextStyle(
                        color: Colors.white,
                        fontFamily: "Work Sans",
                        fontSize: 11,
                        fontWeight: FontWeight.w400)),
              ],
            ),
          ],
        ),
        const SizedBox(height: 20),
        const Divider(
          color: Color(0XFFFFFFFF4D),
        ),
        const SizedBox(height: 10),
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            SvgPicture.asset('public/svg/chat.svg'),
            const SizedBox(
              child: Text(
                'Access to any eight(8) E-engineering interactive Workbook',
                style: TextStyle(
                    fontFamily: "Work Sans",
                    fontSize: 11,
                    color: Colors.white,
                    height: 1.5),
              ),
            )
          ],
        ),
        const SizedBox(height: 10),
        const Divider(
          color: Color(0XFFFFFFFF4D),
        ),
        // const SizedBox(height: 20),
        // GestureDetector(
        //   child: Container(
        //       padding: const EdgeInsets.all(20),
        //       margin: const EdgeInsets.symmetric(vertical: 10),
        //       decoration: BoxDecoration(
        //           color: data['no'] == 2
        //               ? const Color(0XFF1B1B1B)
        //               : const Color(0XFF561505)),
        //       child: const Center(
        //         child: Text(
        //           "GET STARTED",
        //           style: TextStyle(color: Colors.white),
        //         ),
        //       )),
        // )
      ],
    ),
  );
}
