import 'package:esoger/ui/theme/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';

Widget design(BuildContext context) {
  double width = MediaQuery.of(context).size.width;
  return Center(
    child: Container(
      width: width * 0.9,
      // height: 250,
      margin: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
      ),
      child: Column(
        children: [
          Container(
            child: Column(
              children: [
                Image.asset(
                    'public/images/engineering/centrifugal_pump.png'), // replace with your SVG path
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text('CENTRIFUGAL PUMP SIZING',
                          style: TextStyle(
                              fontFamily: "Work Sans",
                              fontSize: 16,
                              fontWeight: FontWeight.bold)),
                      const SizedBox(height: 4),
                      const Text(
                          'Design, Development and in Service or Future Performance Investigations, including Debottlenecking',
                          style: TextStyle(
                              fontFamily: "Work Sans",
                              fontSize: 14,
                              color: Colors.grey)),
                      const SizedBox(height: 8),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            children: [
                              const Text('4.0',
                                  style: TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold)),
                              const SizedBox(width: 8),
                              Row(
                                children: List.generate(5, (index) {
                                  return Icon(Icons.star,
                                      color: index < 4
                                          ? Colors.amber
                                          : Colors.grey,
                                      size: 20);
                                }),
                              ),
                            ],
                          ),
                          GestureDetector(
                            onTap: () {
                              context.push("/calculator");
                            },
                            child: Container(
                              padding: const EdgeInsets.all(5),
                              decoration: BoxDecoration(
                                  border:
                                      Border.all(width: 1, color: primaryColor),
                                  borderRadius: BorderRadius.circular(10)),
                              child: const Text(
                                "View Calculator",
                                style: TextStyle(
                                    fontFamily: "Work Sans",
                                    color: primaryColor),
                              ),
                            ),
                          )
                        ],
                      ),
                      const SizedBox(height: 8),
                      // const Text('Course Progress',
                      //     style: TextStyle(fontSize: 12, color: Colors.grey)),
                      // const SizedBox(height: 4),
                      // LinearProgressIndicator(
                      //   value: 0.8,
                      //   backgroundColor: Colors.grey[300],
                      //   valueColor:
                      //       const AlwaysStoppedAnimation<Color>(Colors.red),
                      // ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 8),
        ],
      ),
    ),
  );
}
