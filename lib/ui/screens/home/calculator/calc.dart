import 'package:flutter/material.dart';

class CalculatorPage extends StatefulWidget {
  @override
  _CalculatorPageState createState() => _CalculatorPageState();
}

class _CalculatorPageState extends State<CalculatorPage> {
  double _inputValue1 = 0.0;
  double _inputValue2 = 0.0;
  String _selectedUnit = 'sm3/h';
  double _outputValue = 0.0;

  // Function to calculate the output value
  double calculateOutput(double input1, double input2) {
    // Example calculation logic
    return input1 * input2;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            children: [
              // First input field
              TextFormField(
                decoration: const InputDecoration(
                  labelText: 'Liquid Flowrate, bblpd',
                  border: OutlineInputBorder(),
                ),
                keyboardType: TextInputType.number,
                onChanged: (value) {
                  setState(() {
                    _inputValue1 = double.tryParse(value) ?? 0.0;
                  });
                },
              ),
              const SizedBox(height: 16),
              // Second input field
              TextFormField(
                decoration: const InputDecoration(
                  labelText: 'Static Head/Lift, ft',
                  border: OutlineInputBorder(),
                ),
                keyboardType: TextInputType.number,
                onChanged: (value) {
                  setState(() {
                    _inputValue2 = double.tryParse(value) ?? 0.0;
                  });
                },
              ),
              const SizedBox(height: 16),
              // Dropdown for selecting the unit
              DropdownButtonFormField<String>(
                decoration: const InputDecoration(
                  labelText: 'Unit',
                  border: OutlineInputBorder(),
                ),
                value: _selectedUnit,
                items: <String>['sm3/h', 'bblpd'].map((String value) {
                  return DropdownMenuItem<String>(
                    value: value,
                    child: Text(value),
                  );
                }).toList(),
                onChanged: (value) {
                  setState(() {
                    _selectedUnit = value!;
                  });
                },
              ),
              SizedBox(height: 16),

              // Button to trigger the calculation
              ElevatedButton(
                onPressed: () {
                  setState(() {
                    _outputValue = calculateOutput(_inputValue1, _inputValue2);
                  });
                },
                child: Text('Calculate'),
              ),
              const SizedBox(height: 16),
              // Table to display input and output data
              Table(
                border: TableBorder.all(),
                children: [
                  TableRow(
                    children: [
                      TableCell(
                          child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          'INPUT DATA',
                          textAlign: TextAlign.center,
                        ),
                      )),
                      TableCell(
                          child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          'OUTPUT DATA',
                          textAlign: TextAlign.center,
                        ),
                      )),
                      TableCell(
                          child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          'COMMENTS',
                          textAlign: TextAlign.center,
                        ),
                      )),
                    ],
                  ),
                  TableRow(
                    children: [
                      TableCell(
                          child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          _inputValue1.toString(),
                          textAlign: TextAlign.center,
                        ),
                      )),
                      TableCell(
                          child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          _outputValue.toString(),
                          textAlign: TextAlign.center,
                        ),
                      )),
                      TableCell(
                          child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          'Calculated Value',
                          textAlign: TextAlign.center,
                        ),
                      )),
                    ],
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
