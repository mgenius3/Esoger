import 'package:esoger/ui/widget/button/back_navigation.dart';
import 'package:esoger/ui/theme/colors.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import './calc.dart';

class CalculatorScreen extends StatefulWidget {
  const CalculatorScreen({super.key});

  @override
  State<CalculatorScreen> createState() => _CalculatorScreenState();
}

class _CalculatorScreenState extends State<CalculatorScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SingleChildScrollView(
      child: Container(
        padding: const EdgeInsets.all(20),
        margin: const EdgeInsets.only(top: 20),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                backNavigation(context),
                GestureDetector(
                  onTap: () {
                    context.push("/calculatorform");
                  },
                  child: Container(
                    padding: const EdgeInsets.all(5),
                    decoration: BoxDecoration(
                        border: Border.all(width: 1, color: primaryColor),
                        borderRadius: BorderRadius.circular(10)),
                    child: const Text(
                      "Submit Design",
                      style: TextStyle(
                          fontFamily: "Work Sans", color: primaryColor),
                    ),
                  ),
                )
              ],
            ),
            const SizedBox(height: 20),
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
                ],
              ),
            ),

            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  padding: const EdgeInsets.all(5),
                  decoration: BoxDecoration(
                      border: Border.all(width: 1),
                      color: Colors.transparent,
                      borderRadius: BorderRadius.circular(10)),
                  child: const Text("suctional linear size",
                      style: TextStyle(fontFamily: "Work Sans")),
                ),
                Container(
                  padding: const EdgeInsets.all(5),
                  decoration: BoxDecoration(
                      border: Border.all(width: 1),
                      color: Colors.transparent,
                      borderRadius: BorderRadius.circular(10)),
                  child: const Text("total dynamic hand",
                      style: TextStyle(fontFamily: "Work Sans")),
                ),
                Container(
                  padding: const EdgeInsets.all(5),
                  decoration: BoxDecoration(
                      border: Border.all(width: 1),
                      color: Colors.transparent,
                      borderRadius: BorderRadius.circular(10)),
                  child: const Text("discharge pressue",
                      style: TextStyle(fontFamily: "Work Sans")),
                )
              ],
            ),
            const SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  padding: const EdgeInsets.all(5),
                  decoration: BoxDecoration(
                      border: Border.all(width: 1),
                      color: Colors.transparent,
                      borderRadius: BorderRadius.circular(10)),
                  child: const Text("suctional linear size",
                      style: TextStyle(fontFamily: "Work Sans")),
                ),
                Container(
                  padding: const EdgeInsets.all(5),
                  decoration: BoxDecoration(
                      border: Border.all(width: 1),
                      color: Colors.transparent,
                      borderRadius: BorderRadius.circular(10)),
                  child: const Text("total dynamic hand",
                      style: TextStyle(fontFamily: "Work Sans")),
                ),
                Container(
                  padding: const EdgeInsets.all(5),
                  decoration: BoxDecoration(
                      border: Border.all(width: 1),
                      color: Colors.transparent,
                      borderRadius: BorderRadius.circular(10)),
                  child: const Text("discharge pressue",
                      style: TextStyle(fontFamily: "Work Sans")),
                )
              ],
            ),
            // Container(
            //   // height: 300,
            //   padding: const EdgeInsets.all(20),
            //   child: Image.asset(
            //     'public/images/calculator.png',
            //     fit: BoxFit.contain,
            //   ),
            // )
            const SizedBox(height: 20),
            SizedBox(
              height: 400,
              child: CalculatorPage(),
            )
          ],
        ),
      ),
    ));
  }
}
