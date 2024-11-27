import 'package:esoger/ui/theme/colors.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:esoger/ui/widget/button/back_navigation.dart';
import 'package:esoger/ui/widget/button/primarybutton.dart';
import 'package:esoger/services/api/api_service.dart';

class TrainingFormPage extends StatefulWidget {
  @override
  _TrainingFormPageState createState() => _TrainingFormPageState();
}

class _TrainingFormPageState extends State<TrainingFormPage> {
  // Form key for validation
  final _formKey = GlobalKey<FormState>();
  bool _isLoading = false;

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

  // Sample API service (replace with your actual implementation)
  ApiService apiService = ApiService();
  // Ensure this is defined in your codebase

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
                // Header
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

                // Name fields
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
                        validator: (value) =>
                            value!.isEmpty ? 'First Name is required' : null,
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
                        validator: (value) =>
                            value!.isEmpty ? 'Last Name is required' : null,
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
                  validator: (value) {
                    if (value!.isEmpty) return 'Email is required';
                    if (!RegExp(r'^[^@]+@[^@]+\.[^@]+').hasMatch(value))
                      return 'Enter a valid email';
                    return null;
                  },
                ),
                const SizedBox(height: 10),

                TextFormField(
                  controller: _phoneNumberController,
                  decoration: InputDecoration(
                    labelText: 'Phone Number',
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(15)),
                  ),
                  validator: (value) =>
                      value!.isEmpty ? 'Phone Number is required' : null,
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
                        validator: (value) =>
                            value!.isEmpty ? 'Course is required' : null,
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
                        validator: (value) =>
                            value!.isEmpty ? 'Certification is required' : null,
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
                        validator: (value) =>
                            value!.isEmpty ? 'Year is required' : null,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 20),

                // Training Approach
                const Center(
                  child: Text('TRAINING APPROACH',
                      style: TextStyle(
                          fontFamily: "Work Sans",
                          fontWeight: FontWeight.bold)),
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
                          fontFamily: "Work Sans",
                          fontWeight: FontWeight.bold)),
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
                          fontFamily: "Work Sans",
                          fontWeight: FontWeight.bold)),
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

                // Submit button
                CustomPrimaryButton(
                  onPressed: _isLoading ? () {} : _submit,
                  color: primaryColor,
                  child: _isLoading
                      ? const SizedBox(
                          height: 20,
                          width: 20,
                          child: CircularProgressIndicator(
                            valueColor: AlwaysStoppedAnimation<Color>(
                              Colors.white,
                            ),
                          ),
                        )
                      : const Text(
                          "Enrol Now",
                          style: TextStyle(color: Colors.white),
                        ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  // Build choice chip widget
  Widget _buildChoiceChip(String label, String selectedOption) {
    return ChoiceChip(
      label: Text(label),
      selected: selectedOption == label,
      onSelected: (isSelected) {
        setState(() {
          _trainingApproach = isSelected ? label : '';
        });
      },
    );
  }

  // Build radio list tile widget
  Widget _buildRadioListTile(String title, String selectedOption) {
    return RadioListTile(
      title: Text(title),
      value: title,
      groupValue: selectedOption,
      onChanged: (value) {
        setState(() {
          _selectedDuration = value as String;
        });
      },
    );
  }

  // Build selectable container widget for amount selection
  Widget _buildSelectableContainer(String label, String selectedOption) {
    return GestureDetector(
      onTap: () {
        setState(() {
          _selectedAmount = label;
        });
      },
      child: Container(
        padding: EdgeInsets.all(10),
        decoration: BoxDecoration(
          color: selectedOption == label ? Colors.blue : Colors.grey[200],
          borderRadius: BorderRadius.circular(15),
          border: Border.all(color: Colors.blue, width: 2),
        ),
        child: Text(label),
      ),
    );
  }

  // Submit function
  void _submit() async {
    if (!_formKey.currentState!.validate()) {
      return; // Exit if the form is not valid
    }

    setState(() {
      _isLoading = true; // Start loading
    });

    try {
      // Collect user details into a map
      Map<String, dynamic> trainingDetails = {
        "firstName": _firstNameController.text.trim(),
        "lastName": _lastNameController.text.trim(),
        "email": _emailController.text.trim(),
        "phoneNumber": _phoneNumberController.text.trim(),
        "course": _courseController.text.trim(),
        "country": _selectedCountry,
        "certification": _certificationController.text.trim(),
        "year": _yearController.text.trim(),
        "trainingApproach": _trainingApproach,
        "duration": _selectedDuration,
        "amount": _selectedAmount,
      };

      // Assuming you have an apiService defined in your widget
      Map responseData =
          await apiService.post("training/register", trainingDetails);

      if (responseData["error"] != null) {
        Fluttertoast.showToast(msg: '${responseData['error']}');
      } else {
        Fluttertoast.showToast(msg: responseData['data']['message']);
        context.push('/payment'); // Navigate to the payment page
      }
    } catch (err) {
      Fluttertoast.showToast(msg: err.toString());
    } finally {
      setState(() {
        _isLoading = false; // Stop loading
      });
    }
  }
}
