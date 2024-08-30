import 'package:esoger/ui/widget/button/back_navigation.dart';
import 'package:flutter/material.dart';
import './widget/header.dart';
import './widget/equipment_design.dart';

class AllEngineeringDesign extends StatefulWidget {
  const AllEngineeringDesign({super.key});

  @override
  State<AllEngineeringDesign> createState() => _AllEngineeringDesignState();
}

class _AllEngineeringDesignState extends State<AllEngineeringDesign> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 40),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  backNavigation(context),
                  const Text(
                    "Equipment Design",
                    style: TextStyle(
                        fontFamily: "Work Sans",
                        fontWeight: FontWeight.w600,
                        color: Color(0XFF2C2C2C),
                        fontSize: 20),
                  ),
                  const SizedBox()
                ],
              ),
              const SizedBox(height: 20),
              Form(
                child: SizedBox(
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
                ),
              ),
              const SizedBox(height: 40),
              GestureDetector(onTap: () {}, child: design(context)),
              const SizedBox(height: 16),
              GestureDetector(onTap: () {}, child: design(context)),
              const SizedBox(height: 16),
              GestureDetector(onTap: () {}, child: design(context)),
              const SizedBox(height: 16),
            ],
          ),
        ),
      ),
    );
  }
}
