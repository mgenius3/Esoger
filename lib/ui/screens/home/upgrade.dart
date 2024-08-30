import 'package:esoger/ui/screens/home/widget/packages.dart';
import 'package:flutter/material.dart';
import 'package:esoger/ui/widget/button/back_navigation.dart';

class UpgradePlan extends StatefulWidget {
  const UpgradePlan({super.key});

  @override
  State<UpgradePlan> createState() => _UpgradePlanState();
}

class _UpgradePlanState extends State<UpgradePlan> {
  List packages_data = [
    {
      "name": "diamond package",
      "note": "start deal",
      "price": "free",
      "price_note": "For the first month",
      'no': 1
    },
    {
      "name": "gold package",
      "note": "best deal",
      "price": "\$5",
      "price_note": "Per month",
      'no': 2
    },
    {
      "name": "platinum package",
      "note": "best deal",
      "price": "\$15",
      "price_note": "Per month",
      'no': 3
    }
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.all(20),
          margin: const EdgeInsets.only(top: 20),
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                backNavigation(context),
                const Text(
                  "Upgrade",
                  style: TextStyle(
                      fontWeight: FontWeight.w600,
                      fontFamily: "Work Sans",
                      color: Color(0XFF2C2C2C),
                      fontSize: 20),
                ),
                const SizedBox(),
              ],
            ),
            const SizedBox(height: 20),
            Column(
              children: [
                ...packages_data.map((d) => packagesToUpgrade(d)).toList()
              ],
            )
          ]),
        ),
      ),
    );
  }
}
