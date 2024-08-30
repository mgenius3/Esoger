import 'package:esoger/ui/widget/button/back_navigation.dart';
import 'package:esoger/ui/widget/button/primarybutton.dart';
import 'package:flutter/material.dart';
import 'package:esoger/ui/widget/alert/index.dart';

class SubmitDesignWorkbookPage extends StatefulWidget {
  @override
  _SubmitDesignWorkbookPageState createState() =>
      _SubmitDesignWorkbookPageState();
}

class _SubmitDesignWorkbookPageState extends State<SubmitDesignWorkbookPage> {
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
                    "Submit A Design Interactive Workbook",
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

              // Discipline Field
              TextFormField(
                decoration: const InputDecoration(
                  labelText: "Discipline",
                  border: OutlineInputBorder(),
                ),
              ),
              const SizedBox(height: 16.0),

              // Description Field (Multi-line Text Field)
              TextFormField(
                decoration: const InputDecoration(
                  labelText: "Description",
                  border: OutlineInputBorder(),
                ),
                maxLines: 5,
              ),
              const SizedBox(height: 16.0),

              // Purpose/Objective Field
              TextFormField(
                decoration: const InputDecoration(
                  labelText: "Purpose / Objective",
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
              const SizedBox(height: 16.0),

              // Phone Number Field
              TextFormField(
                decoration: const InputDecoration(
                  labelText: "Phone Number",
                  border: OutlineInputBorder(),
                ),
                keyboardType: TextInputType.phone,
              ),
              const SizedBox(height: 16.0),

              // Select Country Dropdown Field
              DropdownButtonFormField<String>(
                decoration: const InputDecoration(
                  labelText: "Select Country",
                  border: OutlineInputBorder(),
                ),
                items: ["Country 1", "Country 2", "Country 3"]
                    .map((country) => DropdownMenuItem(
                          value: country,
                          child: Text(country),
                        ))
                    .toList(),
                onChanged: (value) {},
              ),
              const SizedBox(height: 16.0),

              // File Upload Field (not functional, just for UI representation)
              ElevatedButton.icon(
                onPressed: () {},
                icon: const Icon(Icons.attach_file),
                label: const Text("Choose File"),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.transparent,
                  minimumSize: Size(double.infinity, 50),
                  alignment: Alignment.centerLeft,
                ),
              ),
              const SizedBox(height: 32.0),

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
