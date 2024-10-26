import 'package:esoger/utils/format.dart';
import 'package:flutter/material.dart';
import 'package:esoger/ui/widget/button/back_navigation.dart';
import 'package:esoger/ui/widget/button/primarybutton.dart';
import 'package:go_router/go_router.dart';

class ModuleDetails5Page extends StatefulWidget {
  @override
  _ModuleDetails5PageState createState() => _ModuleDetails5PageState();
}

class _ModuleDetails5PageState extends State<ModuleDetails5Page> {
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
                          "MODULE 5: PROCESS PLANT ECONOMICS AND FLOW ASSURANCE STUDIES",
                          30),
                      style: TextStyle(
                        fontSize: 14,
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
              _buildActivityItem('Alternative Analysis Engineering Studies.'),
              _buildActivityItem(
                  'Facility Costing and Sensitivity Analysis. Determine CAPEX, OPEX, NPV, DCFRR, ROI, and PBP.'),
              _buildActivityItem('De-bottlenecking Studies.'),
              _buildActivityItem('Hydrate Studies.'),
              _buildActivityItem(
                  'Flow Assurance Studies - Hydraulic and Sensitivity Analysis.'),
              _buildActivityItem('Depressurization and Blowdown Studies.'),
              _buildActivityItem(
                  'Determine LTCS or SS length required to guard against fatigue stress in CS during Blowdown or depressurization.'),

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
                  '1. Conduct high level costing and sensitivity analysis to determine the best business case using economic indicators like CAPEX, OPEX, ROI, NPV, and PBP.'),
              _buildObjectiveItem(
                  '2. Determine hydrate formation points during gas transmission or Blowdown operations and recommend mitigation techniques.'),
              _buildObjectiveItem(
                  '3. List conditions that favor hydrate formation under normal, offset, and pre-startup operations, and plan to mitigate hydrate formation.'),
              _buildObjectiveItem(
                  '4. Conduct Flow Assurance studies on piping/pipeline networks to determine optimal pipeline sizes and ensure desired fluid direction, pressure, temperature, and flowrate using specialized flow assurance software, such as Pipephase by Esscor Simulation Sciences.'),
              _buildObjectiveItem(
                  '5. Differentiate between depressurization and Blowdown operations.'),
              _buildObjectiveItem(
                  '6. Develop macros to determine the length of LTCS/LCSS/316SS required to guard against fatigue failure in CS piping due to depressurization or Blowdown operations.'),

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
                'Certification: Esoger Certified Senior Level II',
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
