import 'package:esoger/ui/widget/button/back_navigation.dart';
import 'package:esoger/ui/widget/button/primarybutton.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class TrainingFormPage extends StatefulWidget {
  @override
  _TrainingFormPageState createState() => _TrainingFormPageState();
}

class _TrainingFormPageState extends State<TrainingFormPage> {
  // Form key for validation
  final _formKey = GlobalKey<FormState>();

  // Input controllers
  final TextEditingController _firstNameController = TextEditingController();
  final TextEditingController _lastNameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _phoneNumberController = TextEditingController();
  final TextEditingController _courseController = TextEditingController();
  final TextEditingController _certificationController =
      TextEditingController();
  final TextEditingController _yearController = TextEditingController();

  // Selected options
  String _selectedCountry = "Select Country";
  String _trainingApproach = '';
  String _selectedDuration = '';
  String _selectedAmount = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
          child: Container(
        padding: const EdgeInsets.all(20.0),
        margin: const EdgeInsets.only(top: 30),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Name fields
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  backNavigation(context),
                  const Text("EXPRESSION OF INTEREST FORM",
                      style: TextStyle(
                          fontFamily: "Work Sans",
                          fontWeight: FontWeight.bold)),
                  const SizedBox(),
                ],
              ),
              const SizedBox(height: 40),
              Row(
                children: [
                  Expanded(
                    child: TextFormField(
                      controller: _firstNameController,
                      decoration: InputDecoration(
                        labelText: 'First Name',
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(15)),
                      ),
                    ),
                  ),
                  const SizedBox(width: 10),
                  Expanded(
                    child: TextFormField(
                      controller: _lastNameController,
                      decoration: InputDecoration(
                        labelText: 'Last Name',
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(15)),
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 10),
              // Email and Phone Number fields
              TextFormField(
                controller: _emailController,
                decoration: InputDecoration(
                  labelText: 'Email',
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15)),
                ),
              ),
              const SizedBox(height: 10),
              TextFormField(
                controller: _phoneNumberController,
                decoration: InputDecoration(
                  labelText: 'Phone Number',
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15)),
                ),
              ),
              const SizedBox(height: 10),
              // Course and Country fields
              Row(
                children: [
                  Expanded(
                    child: TextFormField(
                      controller: _courseController,
                      decoration: InputDecoration(
                        labelText: 'Course Studied',
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(15)),
                      ),
                    ),
                  ),
                  const SizedBox(width: 10),
                  Expanded(
                    child: DropdownButtonFormField<String>(
                      value: _selectedCountry,
                      items: ['Select Country', 'Country 1', 'Country 2']
                          .map((String value) {
                        return DropdownMenuItem<String>(
                          value: value,
                          child: Text(value),
                        );
                      }).toList(),
                      onChanged: (newValue) {
                        setState(() {
                          _selectedCountry = newValue!;
                        });
                      },
                      decoration: InputDecoration(
                        labelText: 'Country',
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(15)),
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 10),
              // Certification and Year fields
              Row(
                children: [
                  Expanded(
                    child: TextFormField(
                      controller: _certificationController,
                      decoration: InputDecoration(
                        labelText: 'Certification',
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(15)),
                      ),
                    ),
                  ),
                  const SizedBox(width: 10),
                  Expanded(
                    child: TextFormField(
                      controller: _yearController,
                      decoration: InputDecoration(
                        labelText: 'Year of Graduation',
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(15)),
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 20),
              // Training Approach
              const Center(
                child: Text('TRAINING APPROACH',
                    style: TextStyle(
                        fontFamily: "Work Sans", fontWeight: FontWeight.bold)),
              ),
              const SizedBox(height: 10),
              Center(
                child: Wrap(
                  spacing: 10.0,
                  children: [
                    _buildChoiceChip('Online', _trainingApproach),
                    _buildChoiceChip('Team', _trainingApproach),
                    _buildChoiceChip('1 on 1', _trainingApproach),
                    _buildChoiceChip('Google Meet', _trainingApproach),
                    _buildChoiceChip('Physical Session', _trainingApproach),
                  ],
                ),
              ),
              const SizedBox(height: 20),
              // Duration
              const Center(
                child: Text('DURATION',
                    style: TextStyle(
                        fontFamily: "Work Sans", fontWeight: FontWeight.bold)),
              ),
              const SizedBox(height: 10),

              Center(
                child: Column(
                  children: [
                    _buildRadioListTile(
                        '8 Weeks (Weekends – Saturdays & Sundays, 1hr. 30)',
                        _selectedDuration),
                    _buildRadioListTile(
                        '5 Weeks (Week-Days: Monday to Friday, 1 hr/day)',
                        _selectedDuration),
                  ],
                ),
              ),
              const SizedBox(height: 20),
              // Select Payable Amount
              const Center(
                child: Text('SELECT PAYABLE AMOUNT',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        fontFamily: "Work Sans", fontWeight: FontWeight.bold)),
              ),
              const SizedBox(height: 15),
              Center(
                child: Wrap(
                  spacing: 10.0,
                  runSpacing: 10.0,
                  runAlignment: WrapAlignment.center,
                  crossAxisAlignment: WrapCrossAlignment.center,
                  children: [
                    _buildSelectableContainer(
                        'Module 1 Fee 500 USD', _selectedAmount),
                    _buildSelectableContainer(
                        'Module 2 Fee 600 USD', _selectedAmount),
                    _buildSelectableContainer(
                        'Module 3 Fee 700 USD', _selectedAmount),
                    _buildSelectableContainer(
                        'Module 4 Fee 500 USD', _selectedAmount),
                    _buildSelectableContainer(
                        'Module 5 Fee 600 USD', _selectedAmount),
                    _buildSelectableContainer(
                        'Module 6 Fee 700 USD', _selectedAmount),
                    _buildSelectableContainer(
                        '1 & 2 Module Fee 1000 USD', _selectedAmount),
                    _buildSelectableContainer(
                        '2 & 3 Module Fee 1300 USD', _selectedAmount),
                    _buildSelectableContainer(
                        '4 & 5 Module Fee 1100 USD', _selectedAmount),
                    _buildSelectableContainer(
                        '4, 5 & 6 Module Fee 2000 USD', _selectedAmount),
                  ],
                ),
              ),

              const SizedBox(height: 40),
              // CustomPrimaryButton(
              //   onPressed: () {
              //     context.push('/schoolenrolmodule');
              //   },
              //   text: "Submit",
              //   textcolor: Colors.white,
              // )

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
      )),
    );
  }

  // Build choice chip widget
  Widget _buildChoiceChip(String label, String selectedOption) {
    return ChoiceChip(
      label: Text(
        label,
        style: TextStyle(
          fontFamily: "Work Sans",
        ),
      ),
      selected: _trainingApproach == label,
      onSelected: (selected) {
        setState(() {
          _trainingApproach = selected ? label : '';
        });
      },
    );
  }

  // Build radio list tile widget
  Widget _buildRadioListTile(String title, String selectedOption) {
    return RadioListTile<String>(
      title: Text(
        title,
        style: const TextStyle(fontFamily: "Work Sans"),
      ),
      value: title,
      groupValue: _selectedDuration,
      onChanged: (value) {
        setState(() {
          _selectedDuration = value!;
        });
      },
    );
  }

  // Build selectable container widget
  Widget _buildSelectableContainer(String label, String selectedOption) {
    bool isSelected = _selectedAmount == label;
    return GestureDetector(
      onTap: () {
        setState(() {
          _selectedAmount = label;
        });
      },
      child: Container(
        width: 150,
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        decoration: BoxDecoration(
          border: Border.all(
            color: isSelected ? Colors.blue : Colors.grey,
            width: isSelected ? 2 : 1,
          ),
          borderRadius: BorderRadius.circular(8),
        ),
        child: Text(
          label,
          style: const TextStyle(
            fontFamily: "Work Sans",
          ),
        ),
      ),
    );
  }
}
