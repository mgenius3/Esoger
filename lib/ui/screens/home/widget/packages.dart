// import 'package:flutter/material.dart';
// import 'package:flutter_svg/flutter_svg.dart';

// Widget packagesToUpgrade(BuildContext context, Map data) {
//   double width = MediaQuery.of(context).size.width;
//   return Container(
//     width: width * 0.9,
//     margin: const EdgeInsets.only(
//         right: 10, top: 10, bottom: 10), // Margin around each container
//     padding: const EdgeInsets.all(10), // Margin around each container
//     decoration: BoxDecoration(
//       borderRadius: BorderRadius.circular(10),
//       color: data['no'] == 1
//           ? const Color(0XFF200802)
//           : data['no'] == 2
//               ? Colors.black
//               : const Color(0XFF460909), // Different color for each container
//     ),
//     child: Column(
//       crossAxisAlignment: CrossAxisAlignment.start,
//       children: [
//         Row(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             Row(
//               children: List.generate(data['no'], (i) {
//                 return Padding(
//                   padding: const EdgeInsets.all(4.0),
//                   child: SvgPicture.asset('public/svg/gold_badge.svg'),
//                 );
//               }),
//             ),
//             const SizedBox(width: 25),
//             Column(
//               crossAxisAlignment: CrossAxisAlignment.start,
//               children: [
//                 Text(
//                   data['name'].toString().toUpperCase(),
//                   style: const TextStyle(
//                       color: Colors.white,
//                       fontSize: 14.88,
//                       fontFamily: "Work Sans",
//                       fontWeight: FontWeight.w700),
//                 ),
//                 const SizedBox(height: 5),
//                 Text(data['note'],
//                     style: const TextStyle(
//                         color: Colors.white,
//                         fontSize: 10,
//                         fontFamily: "Work Sans",
//                         fontWeight: FontWeight.w300)),
//                 const SizedBox(height: 10),
//                 Text(data['price'].toString().toUpperCase(),
//                     style: const TextStyle(
//                         color: Color(0XFFEC6543),
//                         fontSize: 20.73,
//                         fontFamily: "Work Sans",
//                         fontWeight: FontWeight.w700)),
//                 const SizedBox(height: 5),
//                 Text(data['price_note'].toString(),
//                     style: const TextStyle(
//                         color: Colors.white,
//                         fontFamily: "Work Sans",
//                         fontSize: 11,
//                         fontWeight: FontWeight.w400)),
//               ],
//             ),
//           ],
//         ),
//         const SizedBox(height: 20),
//         const Divider(
//           color: Color(0XFFFFFFFF4D),
//         ),
//         const SizedBox(height: 10),
//         Row(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           mainAxisAlignment: MainAxisAlignment.spaceAround,
//           children: [
//             SvgPicture.asset('public/svg/chat.svg'),
//             SizedBox(
//               width: width * 0.7,
//               child: Text(
//                 'Access to any eight(8) E-engineering interactive Workbook',
//                 style: TextStyle(
//                     fontFamily: "Work Sans",
//                     fontSize: 11,
//                     color: Colors.white,
//                     height: 1.5),
//               ),
//             )
//           ],
//         ),
//         const SizedBox(height: 10),
//         const Divider(
//           color: Color(0XFFFFFFFF4D),
//         ),
//         const SizedBox(height: 20),
//         GestureDetector(
//           child: Container(
//               padding: const EdgeInsets.all(20),
//               margin: const EdgeInsets.symmetric(vertical: 10),
//               decoration: BoxDecoration(
//                   borderRadius: BorderRadius.circular(10),
//                   color: data['no'] == 2
//                       ? const Color(0XFF1B1B1B)
//                       : const Color(0XFF561505)),
//               child: const Center(
//                 child: Text(
//                   "GET STARTED",
//                   style:
//                       TextStyle(fontFamily: "Work Sans", color: Colors.white),
//                 ),
//               )),
//         )
//       ],
//     ),
//   );
// }

import 'package:esoger/models/profile.dart';
import 'package:esoger/services/api/api_service.dart';
import 'package:esoger/ui/widget/web_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

Widget packagesToUpgrade(BuildContext context, Map data, Profile profile) {
  double width = MediaQuery.of(context).size.width;
  ApiService apiService = ApiService();

  void sendPaymentDataToAPI(String paymentMethod, Map price) {
    if (paymentMethod == 'paystack') {
      print(price);
      print(profile.email);
      print(data['name']);
      // var response = await apiService.get(
      //     'process_payment_pays?amount=${price[paymentMethod]}&email=${profile.email}');
      openWebView(
          context,
          'https://esoger.com/api/process_payment_pays?amount=${price[paymentMethod]}&email=${profile.email}',
          'upgrade to ${data['name']}',
          null);
    } else {
      // var response = await apiService.get(
      //     'process_payment_flwv?amount=${price[paymentMethod]}&email=${profile.email}');

      openWebView(
          context,
          'https://esoger.com/api/process_payment_flwv?amount=${price[paymentMethod]}&email=${profile.email}',
          'upgrade to ${data['name']}',
          null);
    }
  }

  // void _processPayment(String paymentMethod, Map price) async {
  // Implement your API call here
  // For example:
  // sendPaymentDataToAPI(paymentMethod, price);

  // if (response) {
  //   ScaffoldMessenger.of(context).showSnackBar(
  //     SnackBar(content: Text('Payment successful with $paymentMethod')),
  //   );
  // } else {
  //   ScaffoldMessenger.of(context).showSnackBar(
  //     SnackBar(content: Text('Payment failed with $paymentMethod')),
  //   );
  // }
  // }

  void _showPaymentOptions(Map price) {
    showModalBottomSheet(
      context: context,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      builder: (BuildContext context) {
        return Container(
          padding: const EdgeInsets.all(20),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              const Text(
                'Choose Payment Method',
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 20),
              ListTile(
                leading: SvgPicture.asset(
                  'public/svg/paystack_icon.svg',
                  width: 100,
                ), // Replace with actual asset path
                title: const Text('payment'),
                onTap: () {
                  Navigator.pop(context);
                  sendPaymentDataToAPI('paystack', price);
                },
              ),
              const Divider(),
              ListTile(
                leading: SvgPicture.asset(
                  'public/svg/flutterwave_icon.svg',
                  width: 100,
                ), // Replace with actual asset path
                title: const Text('payment'),
                onTap: () {
                  Navigator.pop(context);
                  sendPaymentDataToAPI('flutterwave', price);
                },
              ),
            ],
          ),
        );
      },
    );
  }

  return Container(
    width: width * 0.9,
    margin: const EdgeInsets.only(
        right: 10, top: 10, bottom: 10), // Margin around each container
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
                        fontSize: 20.73,
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
            SizedBox(
              width: width * 0.7,
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
        const SizedBox(height: 20),
        GestureDetector(
          onTap: () => _showPaymentOptions(data['price_breakdown']),
          child: Container(
              padding: const EdgeInsets.all(20),
              margin: const EdgeInsets.symmetric(vertical: 10),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: data['no'] == 2
                      ? const Color(0XFF1B1B1B)
                      : const Color(0XFF561505)),
              child: const Center(
                child: Text(
                  "GET STARTED",
                  style:
                      TextStyle(fontFamily: "Work Sans", color: Colors.white),
                ),
              )),
        )
      ],
    ),
  );
}
