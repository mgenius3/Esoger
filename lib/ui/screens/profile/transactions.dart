import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class TransactionHistoryScreen extends StatefulWidget {
  @override
  _TransactionHistoryScreenState createState() =>
      _TransactionHistoryScreenState();
}

class _TransactionHistoryScreenState extends State<TransactionHistoryScreen> {
  final List<Map<String, dynamic>> transactions = [
    {
      'date': 'Today',
      'time': '06:42 am',
      'title': 'Payment',
      'description': 'payment was made for premium package',
    },
    {
      'date': 'Today',
      'time': '02:02 am',
      'title': 'Workbook Registration',
      'description': 'continue your workbook course',
    },
    {
      'date': 'Today',
      'time': '01:55 am',
      'title': 'School Payment',
      'description': 'continue registration for online school',
    },
    {
      'date': '8 / 08 / 2024',
      'time': '06:42 am',
      'title': 'Payment',
      'description': 'payment was made for premium package',
    },
    {
      'date': '8 / 08 / 2024',
      'time': '02:02 am',
      'title': 'Workbook',
      'description': 'continue your workbook course',
    },
    {
      'date': '8 / 08 / 2024',
      'time': '01:55 am',
      'title': 'School',
      'description': 'continue registration for online school',
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          backgroundColor: Colors.white,
          title: const Text(
            'Transaction History',
            style: TextStyle(color: Colors.black),
          ),
          leading: GestureDetector(
            onTap: () {
              context.pop();
            },
            child: Icon(Icons.arrow_back_ios, color: Colors.black),
          )),
      body: ListView.builder(
        itemCount: transactions.length,
        itemBuilder: (context, index) {
          return Padding(
            padding:
                const EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                if (index == 0 ||
                    transactions[index]['date'] !=
                        transactions[index - 1]['date'])
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 8.0),
                    child: Text(
                      transactions[index]['date'],
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                Container(
                  decoration: BoxDecoration(
                    color: Colors.grey.shade200, // Faded background color
                    borderRadius: BorderRadius.circular(8.0),
                  ),
                  child: ListTile(
                    contentPadding:
                        EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
                    leading: Text(
                      transactions[index]['time'],
                      style: TextStyle(
                        fontSize: 12,
                        color: Colors.grey,
                      ),
                    ),
                    title: Text(
                      transactions[index]['title'],
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    subtitle: Text(
                      transactions[index]['description'],
                      style: TextStyle(
                        fontSize: 14,
                        color: Colors.grey,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
