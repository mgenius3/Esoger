import 'package:esoger/provider/profile.dart';
import 'package:esoger/ui/screens/home/widget/packages.dart';
import 'package:flutter/material.dart';
import 'package:esoger/ui/widget/button/back_navigation.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class UpgradePlan extends ConsumerStatefulWidget {
  const UpgradePlan({super.key});

  @override
  ConsumerState<UpgradePlan> createState() => _UpgradePlanState();
}

class _UpgradePlanState extends ConsumerState<UpgradePlan> {
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
      "price": "\$5 (\u20A68,000)",
      "price_note": "Per month",
      "price_breakdown": {"paystack": 8000, "flutterwave": 5},
      'no': 2
    },
    {
      "name": "platinum package",
      "note": "best deal",
      "price": "\$15 (\u20A624,000)",
      "price_breakdown": {"paystack": 24000, "flutterwave": 15},
      "price_note": "Per month",
      'no': 3
    }
  ];

  @override
  Widget build(BuildContext context) {
    var profile = ref.read(profileProvider);
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
                ...packages_data
                    .map((d) => packagesToUpgrade(context, d, profile!))
                    .toList()
              ],
            )
          ]),
        ),
      ),
    );
  }
}
