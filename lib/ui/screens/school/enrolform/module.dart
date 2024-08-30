import 'package:flutter/material.dart';
import 'package:esoger/ui/widget/button/back_navigation.dart';
import 'package:esoger/ui/widget/button/primarybutton.dart';
import 'package:go_router/go_router.dart';

class ModuleDetailsPage extends StatefulWidget {
  @override
  _ModuleDetailsPageState createState() => _ModuleDetailsPageState();
}

class _ModuleDetailsPageState extends State<ModuleDetailsPage> {
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
                  const Text("MODULE 1. APPRECIATIONS",
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
              const Text(
                'Introduction-Part 1',
                style: TextStyle(
                    fontFamily: "Work Sans",
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: Colors.red),
              ),
              SizedBox(height: 5),
              Text(
                'Understand the Oil and Gas Infrastructure: Overview; Onshore and Offshore Topsides Facility; '
                'Subsea Systems Wellhead Stations (Production Skids), Production Platforms/Flowstations, '
                'Tank Farms and, FPSOs.',
                style: const TextStyle(
                  fontFamily: "Work Sans",
                ),
              ),
              SizedBox(height: 15),
              Text(
                'Introduction-Part 2',
                style: TextStyle(
                    fontSize: 16,
                    fontFamily: "Work Sans",
                    fontWeight: FontWeight.bold,
                    color: Colors.red),
              ),
              SizedBox(height: 5),
              Text(
                'What is Process Engineering; What Process Engineer(s) do. Esoger PD and EP, '
                'BOD and SOW Development. The Process Engineer\'s tools.',
              ),
              SizedBox(height: 20),

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
                  '1. List out all the mechanical units associated with onshore, offshore topsides and subsea, OPA, Gas process facility.'),
              _buildObjectiveItem(
                  '2. Layout a sketch or PFD of these units in the order in which they should occur.'),
              _buildObjectiveItem(
                  '3. Identify all the responsibilities or job functions of the Process Engineer.'),
              _buildObjectiveItem(
                  '4. List out for any one project involvement all essential process engineering deliverables.'),
              _buildObjectiveItem(
                  '5. Use global and client specific Workscope standards.'),
              _buildObjectiveItem(
                  '6. Identify the stages of Project execution and how gaseous separations are deliverable.'),
              _buildObjectiveItem(
                  '7. Identify tools and resources required to execute the Project.'),
              _buildObjectiveItem(
                  '8. List out processes common to these deliverables in scope of work.'),
              _buildObjectiveItem(
                  '9. Develop the "Solution Scope of Work" (SSOW) contract document using Esoger\'s template.'),
              _buildObjectiveItem('10. Develop design basis.'),

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
                'Certification: Esoger Certified Process Engineer',
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  fontFamily: "Work Sans",
                ),
              ),

              const SizedBox(height: 40),
              CustomPrimaryButton(
                onPressed: () {
                  context.push('/payment');
                },
                text: "Make Payment",
                textcolor: Colors.white,
              )
            ],
          ),
        ),
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
