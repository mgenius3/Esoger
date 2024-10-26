import 'package:esoger/utils/format.dart';
import 'package:flutter/material.dart';
import 'package:esoger/ui/widget/button/back_navigation.dart';
import 'package:esoger/ui/widget/button/primarybutton.dart';
import 'package:go_router/go_router.dart';

class ModuleDetails4Page extends StatefulWidget {
  @override
  _ModuleDetails4PageState createState() => _ModuleDetails4PageState();
}

class _ModuleDetails4PageState extends State<ModuleDetails4Page> {
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
                          "MODULE 4: INSTRUMENTATION & TECHNICAL SAFETY", 30),
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
                  'Overview - The Process Engineer\'s Perspective'),
              _buildActivityItem(
                  'Setting up NO and SG Instrumentation devices on mechanical units.'),
              _buildActivityItem(
                  'Size and Select CVs, PSVs, PVSVs (Breather Valves), ROs.'),
              _buildActivityItem(
                  'Supply details required in instrument datasheets and PORs.'),
              _buildActivityItem('Chair/add Values to HAZOP Sessions'),

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
                  '1. List roles and apply process variable initiators like switches, transmitters, and controllers in a process control, shutoff, or emergency Blowdown loop.'),
              _buildObjectiveItem(
                  '2. List and apply functions of pressure safeguarding appurtenances like PSV, PVSV, and RO.'),
              _buildObjectiveItem('3. List and apply control valve functions.'),
              _buildObjectiveItem(
                  '4. Develop Safe Chart and participate in Hazard Analysis and Design Review Sessions.'),
              _buildObjectiveItem('5. Size and select CV, PSV, PVSV, and RO.'),
              _buildObjectiveItem('6. Raise Datasheets and POR.'),
              _buildObjectiveItem(
                  '7. Apply level settings for field or remote control of liquid levels in pressure vessels.'),
              _buildObjectiveItem(
                  '8. Determine pressure settings and set points for efficient control of Process Systems to achieve a desired Gas/Liquid ratio.'),

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
                'Certification: Esoger Certified Intermediate Level II',
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
