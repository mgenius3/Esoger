import 'package:esoger/utils/format.dart';
import 'package:flutter/material.dart';
import 'package:esoger/ui/widget/button/back_navigation.dart';
import 'package:esoger/ui/widget/button/primarybutton.dart';
import 'package:go_router/go_router.dart';

class ModuleDetails2Page extends StatefulWidget {
  @override
  _ModuleDetails2PageState createState() => _ModuleDetails2PageState();
}

class _ModuleDetails2PageState extends State<ModuleDetails2Page> {
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
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  backNavigation(context),
                  Text(
                      shortenText(
                          "MODULE 2: SIZING PROCESS MECHANICAL UNITS", 30),
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontFamily: "Work Sans",
                      )),
                  const SizedBox(),
                ],
              ),
              const SizedBox(height: 40),

              // Activities Section
              const Text(
                'ACTIVITIES',
                style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    fontFamily: "Work Sans"),
              ),
              const SizedBox(height: 10),
              _buildActivityItem(
                  'Mechanical Units: Pumps, Separators (Pressure Vessels), Compressors, and Flare Stacks'),
              _buildActivityItem(
                  'Lines: Single and Multiphase Flowlines, Production Manifold Headers and Pipelines, Pressure Vessel lines and Nozzles'),
              _buildActivityItem('Pump lines (Suction and Discharge)'),

              const SizedBox(height: 20),

              // Objectives Section
              Text(
                'OBJECTIVES',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  fontFamily: "Work Sans",
                ),
              ),
              SizedBox(height: 10),
              Text(
                'At the end of this module participants will be able to:',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontFamily: "Work Sans",
                ),
              ),
              SizedBox(height: 10),
              // Objective List
              _buildObjectiveItem(
                  '1. Size and select Flowlines/Pipings/Pipelines NPS for multi and single phase HC fluid services.'),
              _buildObjectiveItem(
                  '2. Size and select Nozzles on Pressure Vessels.'),
              _buildObjectiveItem(
                  '3. Size and select Pumps Suction and Discharge lines.'),
              _buildObjectiveItem(
                  '4. Size and select Pump type using criteria such as NPSHA/R, BHP, BEP, and TDH in vendor bid reviews.'),
              _buildObjectiveItem(
                  '5. Determine pressure vessel sizes using particle size, vapor velocity, and liquid residence time criteria.'),
              _buildObjectiveItem(
                  '6. Size and select Compressor type using Polytropic Brake Horse Power, Operating Points, Sonic Velocity, and BMEP for vendor bid reviews.'),
              _buildObjectiveItem(
                  '7. Size Flare stack height and diameter to ensure personnel protection from radiation.'),

              SizedBox(height: 20),
              // Duration and Certification
              Text(
                'Duration: Two Weeks',
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  fontFamily: "Work Sans",
                ),
              ),
              SizedBox(height: 10),
              Text(
                'Certification: Esoger Certified Intermediate Level 1',
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  fontFamily: "Work Sans",
                ),
              ),

              const SizedBox(height: 40),
            ],
          ),
        ),
      ),
    );
  }

  // Helper method to build each activity item
  Widget _buildActivityItem(String text) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8.0),
      child: Text(
        text,
        style: TextStyle(fontFamily: "Work Sans"),
      ),
    );
  }

  // Helper method to build each objective item
  Widget _buildObjectiveItem(String text) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8.0),
      child: Text(
        text,
        style: TextStyle(fontFamily: "Work Sans"),
      ),
    );
  }
}
