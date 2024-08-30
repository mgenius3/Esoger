import 'package:esoger/ui/widget/button/back_navigation.dart';
import 'package:esoger/ui/widget/button/primarybutton.dart';
import 'package:flutter/material.dart';
import 'package:esoger/ui/widget/alert/index.dart';

class AboutMePage extends StatefulWidget {
  @override
  _AboutMePageState createState() => _AboutMePageState();
}

class _AboutMePageState extends State<AboutMePage> {
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Form(
          key: _formKey,
          child: ListView(
            children: [
              const SizedBox(height: 20),

              Row(
                children: [
                  backNavigation(context),
                  const SizedBox(width: 10),
                  const Text(
                    "About Me",
                    style: TextStyle(fontSize: 19),
                  ),
                ],
              ),
              const SizedBox(height: 30),
              TextFormField(
                decoration: const InputDecoration(
                  labelText: "First Name",
                  border: OutlineInputBorder(),
                ),
              ),
              const SizedBox(height: 16.0),

              // Surname Field
              TextFormField(
                decoration: const InputDecoration(
                  labelText: "Surname",
                  border: OutlineInputBorder(),
                ),
              ),
              const SizedBox(height: 16.0),

              // Description Field (Multi-line Text Field)
              TextFormField(
                decoration: const InputDecoration(
                  labelText: "Phone Number",
                  border: OutlineInputBorder(),
                ),
              ),
              const SizedBox(height: 16.0),

              // Email Address Field
              TextFormField(
                decoration: const InputDecoration(
                  labelText: "Email Address",
                  border: OutlineInputBorder(),
                ),
                keyboardType: TextInputType.emailAddress,
              ),
              const SizedBox(height: 50.0),

              // Submit Button
              CustomPrimaryButton(
                onPressed: () {
                  showAlert(context);
                },
                text: "Submit Now",
                textcolor: Colors.white,
              ),
            ],
          ),
        ),
      ),
    );
  }

  void showAlert(BuildContext context) {
    showAlertDialog(context,
        children: [
          Image.asset('public/images/checksuccessful.png'),
          const SizedBox(height: 20),
          Column(
            children: [
              Text("Successful",
                  style: TextStyle(
                      fontFamily: 'Work Sans',
                      fontWeight: FontWeight.w500,
                      fontSize: 20)),
              SizedBox(height: 20),
              Text("You are good to go",
                  style: TextStyle(
                      fontFamily: 'Work Sans',
                      fontWeight: FontWeight.w400,
                      fontSize: 11)),
              SizedBox(height: 20),
            ],
          )
        ],
        routes: "home",
        buttontext: "Proceed to dashboard");
  }
}
