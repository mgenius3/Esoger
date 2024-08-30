import 'package:flutter/material.dart';
import 'package:esoger/ui/widget/button/back_navigation.dart';
import 'package:esoger/ui/widget/button/primarybutton.dart';
import 'package:go_router/go_router.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:esoger/ui/widget/alert/index.dart';

class PaymentPage extends StatefulWidget {
  @override
  _PaymentPageState createState() => _PaymentPageState();
}

class _PaymentPageState extends State<PaymentPage> {
  bool saveCardDetails = false;
  int selectedPaymentMethod = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: const EdgeInsets.all(20.0),
        margin: const EdgeInsets.only(top: 30),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              backNavigation(context),
              const SizedBox(height: 20),
              const Text(
                'GOLD PACKAGE',
                style: TextStyle(
                  fontSize: 18,
                  fontFamily: "Work Sans",
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 8),
              Row(
                children: [
                  Icon(Icons.emoji_events_outlined),
                  SizedBox(width: 8),
                  Text(
                    'Access to any eight (8) E-\nengineering Interactive WorkBook',
                    style: TextStyle(
                      fontFamily: "Work Sans",
                    ),
                  )
                ],
              ),
              const SizedBox(height: 16),
              const Divider(),
              const SizedBox(height: 16),
              // Row(children: [
              //   IconButton(
              //     icon: const Icon(Icons.radio_button_checked),
              //     onPressed: () {
              //       setState(() {
              //         selectedPaymentMethod = 0;
              //       });
              //     },
              //   ),
              //   SvgPicture.asset('public/svg/card.svg')
              // ]),
              const SizedBox(height: 16),
              const Text(
                'Pay With:',
                style: TextStyle(
                  fontSize: 16,
                  fontFamily: "Work Sans",
                  fontWeight: FontWeight.bold,
                ),
              ),
              Row(
                children: [
                  Expanded(
                      child: RadioListTile(
                    title: Text(
                      'Card',
                      style: TextStyle(
                        fontSize: 16,
                        fontFamily: "Work Sans",
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    value: 0,
                    groupValue: selectedPaymentMethod,
                    onChanged: (value) {
                      setState(() {
                        selectedPaymentMethod = value!;
                      });
                    },
                  )),
                  SvgPicture.asset('public/svg/card.svg')
                ],
              ),
              RadioListTile(
                title: Text(
                  'Bank',
                  style: TextStyle(
                    fontSize: 16,
                    fontFamily: "Work Sans",
                    fontWeight: FontWeight.bold,
                  ),
                ),
                value: 1,
                groupValue: selectedPaymentMethod,
                onChanged: (value) {
                  setState(() {
                    selectedPaymentMethod = value!;
                  });
                },
              ),
              RadioListTile(
                title: const Text(
                  'Transfer',
                  style: TextStyle(
                    fontSize: 16,
                    fontFamily: "Work Sans",
                    fontWeight: FontWeight.bold,
                  ),
                ),
                value: 2,
                groupValue: selectedPaymentMethod,
                onChanged: (value) {
                  setState(() {
                    selectedPaymentMethod = value!;
                  });
                },
              ),
              if (selectedPaymentMethod == 0) ...[
                const SizedBox(height: 16),
                const TextField(
                  decoration: InputDecoration(
                    labelText: 'Card Number',
                    border: OutlineInputBorder(),
                  ),
                  keyboardType: TextInputType.number,
                ),
                const SizedBox(height: 16),
                Row(
                  children: [
                    Expanded(
                      child: TextField(
                        decoration: InputDecoration(
                          labelText: 'Expiration Date',
                          hintText: 'MM/YY',
                          border: OutlineInputBorder(),
                        ),
                        keyboardType: TextInputType.datetime,
                      ),
                    ),
                    SizedBox(width: 16),
                    Expanded(
                      child: TextField(
                        decoration: InputDecoration(
                          labelText: 'CVV',
                          border: OutlineInputBorder(),
                        ),
                        keyboardType: TextInputType.number,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 16),
                CheckboxListTile(
                  title: const Text(
                    'Save card details',
                    style: TextStyle(fontFamily: "Work Sans"),
                  ),
                  value: saveCardDetails,
                  onChanged: (value) {
                    setState(() {
                      saveCardDetails = value!;
                    });
                  },
                ),
              ],
              const SizedBox(height: 16),
              CustomPrimaryButton(
                onPressed: () {
                  showAlert(context);
                },
                text: "Pay #40000",
                textcolor: Colors.white,
              ),
              const SizedBox(height: 16),
              const Text(
                'Your personal data will be used to process your order, support your experience throughout this website, '
                'and for other purposes described in our privacy policy.',
                textAlign: TextAlign.center,
                style: TextStyle(
                    fontFamily: "Work Sans",
                    fontSize: 12,
                    fontWeight: FontWeight.w300),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void showAlert(BuildContext context) {
    showAlertDialog(context,
        children: [
          Image.asset('public/images/checksuccessful.png', scale: 1.5),
          const SizedBox(height: 20),
          Column(
            children: [
              Text("Payment Successful",
                  style: TextStyle(
                      fontFamily: 'Work Sans',
                      fontWeight: FontWeight.w500,
                      fontSize: 20)),
              SizedBox(height: 20),
            ],
          )
        ],
        routes: "paymentdetails",
        buttontext: "Ok");
  }
}
