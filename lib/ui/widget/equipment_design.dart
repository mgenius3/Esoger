// import 'package:esoger/models/product_design.dart';
// import 'package:esoger/ui/theme/colors.dart';
// import 'package:esoger/ui/widget/web_view.dart';
// import 'package:esoger/utils/format.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_svg/flutter_svg.dart';
// import 'package:go_router/go_router.dart';
// import 'dart:convert';

// Widget design(BuildContext context, ProductDesign data,
//     {required String plan, required int index}) {
//   double width = MediaQuery.of(context).size.width;
//   final String base64Image = data.image;
//   final base64Str = base64Image.split(',').last;
//   final bytes = base64Decode(base64Str); // Decode the base64 string
//   return Center(
//     child: Container(
//       width: width * 0.7,
//       // height: 250,
//       margin: const EdgeInsets.all(10),
//       decoration: BoxDecoration(
//         borderRadius: BorderRadius.circular(10),
//       ),
//       child: Column(
//         children: [
//           Container(
//             child: Column(
//               children: [
//                 Image.memory(bytes),
//                 Image.asset(
//                     'public/images/engineering/centrifugal_pump.png'), // replace with your SVG path
//                 Padding(
//                   padding: const EdgeInsets.all(8.0),
//                   child: Column(
//                     crossAxisAlignment: CrossAxisAlignment.start,
//                     children: [
//                       Text(data.product,
//                           style: TextStyle(
//                               fontFamily: "Work Sans",
//                               fontSize: 14,
//                               fontWeight: FontWeight.bold)),
//                       const SizedBox(height: 4),
//                       Text(formatText(data.purpose),
//                           style: TextStyle(
//                               fontFamily: "Work Sans",
//                               fontSize: 12,
//                               color: Colors.grey)),
//                       const SizedBox(height: 8),
//                       Row(
//                         mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                         children: [
//                           Row(
//                             children: [
//                               const Text('4.0',
//                                   style: TextStyle(
//                                       fontSize: 14,
//                                       fontWeight: FontWeight.bold)),
//                               const SizedBox(width: 8),
//                               Row(
//                                 children: List.generate(5, (index) {
//                                   return Icon(Icons.star,
//                                       color: index < 4
//                                           ? Colors.amber
//                                           : Colors.grey,
//                                       size: 15);
//                                 }),
//                               ),
//                             ],
//                           ),
//                           GestureDetector(
//                             onTap: () {
//                               // context.push("/calculator");
//                               openWebView(context, data.calculator,
//                                   data.product, bytes);
//                             },
//                             child: Container(
//                               padding: const EdgeInsets.all(2),
//                               decoration: BoxDecoration(
//                                   border:
//                                       Border.all(width: 1, color: primaryColor),
//                                   borderRadius: BorderRadius.circular(10)),
//                               child: const Text(
//                                 "View Calculator",
//                                 style: TextStyle(
//                                     fontSize: 12,
//                                     fontFamily: "Work Sans",
//                                     color: primaryColor),
//                               ),
//                             ),
//                           )
//                         ],
//                       ),
//                       const SizedBox(height: 8),
//                       // const Text('Course Progress',
//                       //     style: TextStyle(fontSize: 12, color: Colors.grey)),
//                       // const SizedBox(height: 4),
//                       // LinearProgressIndicator(
//                       //   value: 0.8,
//                       //   backgroundColor: Colors.grey[300],
//                       //   valueColor:
//                       //       const AlwaysStoppedAnimation<Color>(Colors.red),
//                       // ),
//                     ],
//                   ),
//                 ),
//               ],
//             ),
//           ),
//           const SizedBox(height: 8),
//         ],
//       ),
//     ),
//   );
// }

import 'package:esoger/models/product_design.dart';
import 'package:esoger/ui/theme/colors.dart';
import 'package:esoger/ui/widget/web_view.dart';
import 'package:esoger/utils/format.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';
import 'dart:convert';

Widget design(BuildContext context, ProductDesign data,
    {required String plan, required int index}) {
  double width = MediaQuery.of(context).size.width;
  final String base64Image = data.image;
  final base64Str = base64Image.split(',').last;
  final bytes = base64Decode(base64Str); // Decode the base64 string

  // Function to get the upgrade message based on the plan
  String getUpgradeMessage(String plan) {
    if (plan == 'diamond') {
      return "Please upgrade to Gold or Platinum to access the workbook calculator.";
    } else if (plan == 'gold') {
      return "Please upgrade to Platinum to access the workbook calculator.";
    }
    return "Please upgrade to a higher plan to access this feature.";
  }

  return Center(
    child: Container(
      width: width * 0.7,
      margin: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
      ),
      child: Column(
        children: [
          Container(
            child: Column(
              children: [
                Image.memory(bytes),
                Image.asset('public/images/engineering/centrifugal_pump.png'),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(data.product,
                          style: TextStyle(
                              fontFamily: "Work Sans",
                              fontSize: 14,
                              fontWeight: FontWeight.bold)),
                      const SizedBox(height: 4),
                      Text(formatText(data.purpose),
                          style: TextStyle(
                              fontFamily: "Work Sans",
                              fontSize: 12,
                              color: Colors.grey)),
                      const SizedBox(height: 8),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            children: [
                              const Text('4.0',
                                  style: TextStyle(
                                      fontSize: 14,
                                      fontWeight: FontWeight.bold)),
                              const SizedBox(width: 8),
                              Row(
                                children: List.generate(5, (index) {
                                  return Icon(Icons.star,
                                      color: index < 4
                                          ? Colors.amber
                                          : Colors.grey,
                                      size: 15);
                                }),
                              ),
                            ],
                          ),
                          GestureDetector(
                            onTap: () {
                              if ((plan == 'diamond' && index >= 3) ||
                                  (plan == 'gold' && index >= 5)) {
                                showDialog(
                                  context: context,
                                  builder: (BuildContext context) {
                                    return AlertDialog(
                                      title: const Text("Upgrade Required"),
                                      content: Text(getUpgradeMessage(plan)),
                                      actions: [
                                        TextButton(
                                          onPressed: () {
                                            Navigator.of(context).pop();
                                          },
                                          child: const Text("Close"),
                                        ),
                                      ],
                                    );
                                  },
                                );
                              } else {
                                openWebView(context, data.calculator,
                                    data.product, bytes);
                              }
                            },
                            child: Container(
                              padding: const EdgeInsets.all(2),
                              decoration: BoxDecoration(
                                  border:
                                      Border.all(width: 1, color: primaryColor),
                                  borderRadius: BorderRadius.circular(10)),
                              child: const Text(
                                "View Calculator",
                                style: TextStyle(
                                    fontSize: 12,
                                    fontFamily: "Work Sans",
                                    color: primaryColor),
                              ),
                            ),
                          )
                        ],
                      ),
                      const SizedBox(height: 8),
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
