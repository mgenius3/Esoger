import 'package:esoger/utils/format.dart';
import 'package:flutter/material.dart';
import 'package:esoger/ui/widget/button/back_navigation.dart';
import 'package:esoger/ui/widget/button/primarybutton.dart';
import 'package:go_router/go_router.dart';

class ModuleDetails3Page extends StatefulWidget {
  @override
  _ModuleDetails3PageState createState() => _ModuleDetails3PageState();
}

class _ModuleDetails3PageState extends State<ModuleDetails3Page> {
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
                          "MODULE 3: PROCESS PLANT DETAILED PROJECT AND MODELING",
                          30),
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
                  'Piping Material Selection and Plant Drawings Development'),
              _buildActivityItem(
                  'Piping Material Classification, New and Existing Drawing Development.'),
              _buildActivityItem('PFD, P&ID, PSFS, UFD, and U&ID.'),

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
                  '1. Set up and execute steady-state and dynamic models using Aspenhysys and Provision II simulation software.'),
              _buildObjectiveItem(
                  '2. Understand selection criteria for “Production Separators” as vertical or horizontal, and as two- or three-phase service in operation.'),
              _buildObjectiveItem(
                  '3. Select and sequence process equipment for oil, produced water, and gas effluents.'),
              _buildObjectiveItem(
                  '4. Identify refrigeration systems suited for Sales Gas, NGL, and LPG processes.'),
              _buildObjectiveItem(
                  '5. Understand Acid Gas Treatment for CO2 and H2S removal to achieve high-quality Sweet Gas.'),
              _buildObjectiveItem(
                  '6. Determine heat, material, and energy balances for various process systems.'),
              _buildObjectiveItem(
                  '7. Develop PFDs and P&IDs for Oil and Gas Production Facilities, focusing on Sales Gas Production.'),
              _buildObjectiveItem(
                  '8. Understand Piping Material Selection based on fluid composition and thermal conditions.'),
              _buildObjectiveItem(
                  '9. Set up instruments and process control loops on piping and mechanical units.'),
              _buildObjectiveItem(
                  '10. Develop Safe Charts or query deliverables using API RP 14C.'),

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
                'Certification: Esoger Certified Senior Level 1',
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
