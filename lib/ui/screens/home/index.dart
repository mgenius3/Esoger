import 'package:esoger/ui/theme/colors.dart';
import 'package:esoger/ui/widget/button/primarybutton.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import './widget/header.dart';
import 'widget/list_packages.dart';
import './widget/equipment_design.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List packages_data = [
    {
      "name": "diamond package",
      "note": "start deal",
      "price": "free",
      "price_note": "For the first month"
    },
    {
      "name": "gold package",
      "note": "best deal",
      "price": "\$5",
      "price_note": "Per month"
    },
    {
      "name": "platinum package",
      "note": "best deal",
      "price": "\$15",
      "price_note": "Per month"
    }
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 40),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              header(),
              const SizedBox(height: 40),
              Form(
                  child: Container(
                height: 40,
                child: Material(
                  elevation: 12.0,
                  borderRadius: BorderRadius.circular(8),
                  shadowColor: Colors.black.withOpacity(0.75),
                  child: TextFormField(
                    decoration: InputDecoration(
                      labelText: 'Search Now',
                      prefixIcon: const Icon(Icons.search),
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(14),
                          borderSide: BorderSide.none),
                    ),
                    onChanged: (text) => setState(() {
                      // _emailTextController.text = text;
                    }),
                  ),
                ),
              )),
              const SizedBox(height: 40),
              Container(
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(14)),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        const SizedBox(width: 20),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text(
                              'You are on',
                              style: TextStyle(
                                  fontFamily: "Work Sans",
                                  fontSize: 16,
                                  fontWeight: FontWeight.w500,
                                  color: Color(0XFF3F3F40)),
                            ),
                            const SizedBox(height: 10),
                            const Text('Diamond Plan',
                                style: TextStyle(
                                  fontSize: 24,
                                  fontFamily: "Work Sans",
                                  fontWeight: FontWeight.w700,
                                )),
                            const SizedBox(height: 10),
                            const Text('30 days free trial',
                                style: TextStyle(
                                    fontSize: 10,
                                    fontFamily: "Work Sans",
                                    fontWeight: FontWeight.w600,
                                    color: Colors.redAccent)),
                            const SizedBox(height: 10),
                            SizedBox(
                              height: 40,
                              child: CustomPrimaryButton(
                                width: 120,
                                onPressed: () {
                                  context.push("/upgrade");
                                },
                                text: 'UPGRADE',
                                textcolor: Colors.white,
                                color: const Color(0XFFC10002),
                              ),
                            )
                          ],
                        ),
                      ],
                    ),
                    SizedBox(
                        child:
                            Image.asset('public/images/phone_ background.png'))
                  ],
                ),
              ),
              const SizedBox(height: 30),
              const Text(
                "Our Packages",
                style: TextStyle(
                    fontFamily: "Work Sans",
                    fontWeight: FontWeight.w600,
                    color: Color(0XFF2C2C2C)),
              ),
              packages(context, data: packages_data),
              const SizedBox(height: 30),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text('Equipment Design',
                        style: TextStyle(
                            fontFamily: "Work Sans",
                            fontSize: 18,
                            fontWeight: FontWeight.bold)),
                    TextButton(
                        onPressed: () {
                          context.push('/all_design');
                        },
                        child: const Text('See all >',
                            style: TextStyle(
                                fontFamily: "Work Sans", color: primaryColor))),
                  ],
                ),
              ),
              design(context),
              const SizedBox(height: 16),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  CircleAvatar(radius: 4, backgroundColor: Colors.red),
                  SizedBox(width: 4),
                  CircleAvatar(radius: 4, backgroundColor: Colors.grey),
                  SizedBox(width: 4),
                  CircleAvatar(radius: 4, backgroundColor: Colors.grey),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
