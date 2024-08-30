import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:esoger/ui/widget/button/primarybutton.dart';
import 'package:go_router/go_router.dart';

class SchoolScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
        padding: EdgeInsets.all(16.0),
        child: Container(
          margin: const EdgeInsets.symmetric(vertical: 40),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Center(
                child: const Text(
                  'MODULES',
                  style: TextStyle(
                      fontFamily: "Work Sans",
                      fontSize: 20,
                      fontWeight: FontWeight.bold),
                ),
              ),
              SizedBox(height: 16),
              ModuleCard(
                icon: Icons.app_registration,
                title: 'Module 1 - Appreciation',
              ),
              ModuleCard(
                icon: Icons.build,
                title:
                    'Module 2 - Sizing Process Mechanical Units, Pipings and Pipelines using MS Excel',
              ),
              ModuleCard(
                icon: Icons.assignment,
                title:
                    'Module 3 - Part A: Process Plant Detailed Project Studies and Modeling',
              ),
              ModuleCard(
                icon: Icons.security,
                title: 'Module 4 - Instrumentation & Technical Safety',
              ),
              ModuleCard(
                icon: Icons.eco,
                title:
                    'PRE-750 - Module 5 - Process Plant Economics and Flow Assurance Studies',
              ),
              // SizedBox(height: 16),
              // const Center(
              //   child: Text(
              //     'ALTERNATIVE TRAINING FEE',
              //     style: TextStyle(
              //         fontFamily: "Work Sans",
              //         fontSize: 16,
              //         fontWeight: FontWeight.bold),
              //   ),
              // ),
              // const SizedBox(height: 8),
              // Container(
              //   padding: EdgeInsets.all(16.0),
              //   color: Colors.black,
              //   child: const Text(
              //     'Fresh graduates and jobless engineers can pay just 100,000.00 (USD 500.00) plus 15% of total salary package per year, when you get a job.',
              //     style:
              //         TextStyle(fontFamily: "Work Sans", color: Colors.white),
              //     textAlign: TextAlign.center,
              //   ),
              // ),
              const SizedBox(height: 16),
              const Center(
                child: Text(
                  'Training Modules',
                  style: TextStyle(
                      fontFamily: "Work Sans",
                      fontSize: 20,
                      fontWeight: FontWeight.bold),
                ),
              ),
              const SizedBox(height: 8),
              SizedBox(
                width: double.infinity,
                child: TrainingModuleCard(
                  title:
                      'Group Participation: In-person training (one to four weeks)',
                  price: 'From USD 3,000.00',
                  description:
                      'Cost includes: Round trip, hotel accommodation and full board of attendance of all participants.',
                  contact: 'Contact us: +234 7012345678',
                ),
              ),
              const SizedBox(width: 16),
              SizedBox(
                width: double.infinity,
                child: TrainingModuleCard(
                  title: 'Electronic Training',
                  price: 'Fee: NGN 500,000 per person',
                  description: '1 Module Process.\nDuration: 6 - 12 months.',
                ),
              ),
              const SizedBox(height: 30),
              CustomPrimaryButton(
                onPressed: () {
                  context.push('/schoolenrolform');
                },
                text: "Enrol Now",
                textcolor: Colors.white,
              )
            ],
          ),
        ));
  }
}

class ModuleCard extends StatelessWidget {
  final IconData icon;
  final String title;

  ModuleCard({required this.icon, required this.title});

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.symmetric(vertical: 8.0),
      child: ListTile(
        leading: Icon(icon, color: Colors.orange),
        title: Text(
          title,
          style: const TextStyle(fontFamily: "Work Sans"),
        ),
      ),
    );
  }
}

class TrainingModuleCard extends StatelessWidget {
  final String title;
  final String price;
  final String description;
  final String? contact;

  TrainingModuleCard({
    required this.title,
    required this.price,
    required this.description,
    this.contact,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.white70,
      margin: const EdgeInsets.symmetric(vertical: 8.0),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title,
              style: const TextStyle(
                  fontFamily: "Work Sans",
                  fontSize: 16,
                  fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),
            Text(price,
                style: const TextStyle(
                    fontFamily: "Work Sans",
                    color: Color(0XFFEC6543),
                    fontWeight: FontWeight.bold)),
            const SizedBox(height: 8),
            Text(description),
            if (contact != null) ...[
              const SizedBox(height: 8),
              Text(contact!,
                  style: const TextStyle(
                      fontFamily: "Work Sans",
                      color: Color.fromRGBO(0, 0, 0, 0.65))),
            ],
          ],
        ),
      ),
    );
  }
}
