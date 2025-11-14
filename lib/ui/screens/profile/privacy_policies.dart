import 'package:flutter/material.dart';

class PrivacyPolicyScreen extends StatelessWidget {
  const PrivacyPolicyScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios, color: Color(0XFF561505)),
          onPressed: () => Navigator.pop(context),
        ),
        title: const Text(
          'Terms & Conditions',
          style: TextStyle(
            color: Color(0XFF561505),
            fontFamily: "Work Sans",
            fontWeight: FontWeight.w600,
          ),
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Header Section
              Container(
                width: double.infinity,
                padding: const EdgeInsets.all(20),
                decoration: BoxDecoration(
                  color: const Color(0XFF561505).withOpacity(0.05),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: const Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      'Esoger Platform',
                      style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.w700,
                        fontFamily: "Work Sans",
                        color: Color(0XFF561505),
                      ),
                    ),
                    SizedBox(height: 8),
                    Text(
                      'Terms and Conditions of Service',
                      style: TextStyle(
                        fontSize: 14,
                        fontFamily: "Work Sans",
                        color: Colors.black54,
                      ),
                    ),
                    SizedBox(height: 12),
                    Text(
                      'Last Updated: November 2025',
                      style: TextStyle(
                        fontSize: 12,
                        fontFamily: "Work Sans",
                        color: Colors.black45,
                        fontStyle: FontStyle.italic,
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 24),

              // Section 1
              _buildSection(
                '1. Introduction',
                'Welcome to esoger.com and its app is a registered business in Nigeria under the aegis of Esoger Engineering Solutions Limited, RC721281 as a peer-to-peer platform with proven process engineering calculators/interactive workbooks for the oil and gas industry. By using our app, you agree to these Terms of Service, which govern the use of our services.',
              ),

              // Section 2
              _buildSection(
                '2. Eligibility',
                '',
                bulletPoints: [
                  'You must be at least 18 years old to use our app or webapp.',
                  'You must have a valid email address and phone number.',
                ],
              ),

              // Section 3
              _buildSection(
                '3. Account Registration',
                '',
                bulletPoints: [
                  'You must provide accurate and complete information when registering.',
                  'You are responsible for maintaining the security of your account by ensuring your sign-up details remain strictly confidential.',
                ],
              ),

              // Section 4
              _buildSection(
                '4. Esoger Terms',
                '',
                customContent: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    _buildNumberedPoint(
                      'I',
                      'The interactive workbooks or calculators are instantly available to users with or without an active subscription plan. There are two subscription plans available and one free/diamond unsubscribed for plan. Only subscribed plans expire after 30 days of use or signing into the platform. The free plans are available, for all time.',
                    ),
                    _buildNumberedPoint(
                      'II',
                      'The Free or Diamond unsubscribed for plan allows a user access to nine (9) interactive workbooks or calculators',
                    ),
                    _buildNumberedPoint(
                      'III',
                      'The Gold Package subscription plan gives users access to twelve (12) interactive workbooks or calculators',
                    ),
                    _buildNumberedPoint(
                      'IV',
                      'The Platinum Package grants access to all 15 interactive workbooks or calculators',
                    ),
                    _buildNumberedPoint(
                      'V',
                      'Post signing into the esoger App or webapp, users who opt for a payment plan or wishes to access more than nine (9) interactive workbooks shall have to enter their debit card details to the platform billing portal via banners, which convey the fee charged per subscription plan.\n\nUsers under the Free or Diamond Package are not debited immediately after entering their debit card details. They are requested to enter their card details post the mandatory 30-day expiration of their access to the nine free interactive workbooks.\n\nUsers in the Gold and Platinum category are debited once they enter their debit Card details having opted for any of these plans',
                    ),
                    _buildNumberedPoint(
                      'VI',
                      'Users cannot enter for more than one active plan. Subscription expires after exactly 30 days, unless users continue to access the workbooks under their chosen subscription at expiration of their active duration.',
                    ),
                  ],
                ),
              ),

              // Section 5
              _buildSection(
                '5. Fees',
                'The Free Category users are not charged; the Gold category users are charged USD\$5 per month while the Platinum Category users are billed USD\$15 each month.',
              ),

              // Section 6
              _buildSection(
                '6. Payment and Settlement',
                'Payments are processed through our third-party payment provider, Flutterwave. Settlement of funds will occur within 24 hours.',
              ),

              // Section 7
              _buildSection(
                '7. Dispute Resolution',
                'If a dispute arises, for reasons of inability to access paid for subscriptions post subscription duly entered for, user can reach the platform by leaving a message through our contact form online. Where the reason for failure to access the esoger range of interactive workbooks is due to a failure of the hosted servers, subscription made for that month by all users shall be prorated and where there is a balance to be returned to a customer, calculated amounts due shall be reverted within 48 hours.',
              ),

              // Section 8
              _buildSection(
                '8. Liability',
                '',
                bulletPoints: [
                  'We are not liable for any losses or damage resulting from use of our app.',
                  'Users are responsible for their own actions and decisions and are expected to keep their subscription sign-up card details confidential.',
                ],
              ),

              // Section 9
              _buildSection(
                '9. Governing Law',
                'These Terms of Service are governed by the Central Bank of Nigeria Act, as Amended in 1999, the United Nations Commission on International Trade Rules 1996 & 1998, Common Law of Contract Principles and Sales of Goods Act of 1893 to which Nigeria subscribes as the Federal Republic of Nigeria.',
              ),

              // Section 10
              _buildSection(
                '10. Changes to Terms',
                'We reserve the right to modify these Terms and Conditions of Service at any time without notifying the public.',
              ),

              // Section 11
              _buildSection(
                '11. Acceptance',
                'By using our app, you acknowledge that you have read, understood, and agreed to these Terms and Conditions of Service.',
              ),

              const SizedBox(height: 30),

              // Footer
              Container(
                width: double.infinity,
                padding: const EdgeInsets.all(20),
                decoration: BoxDecoration(
                  color: const Color(0XFF561505).withOpacity(0.05),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: const Column(
                  children: [
                    Text(
                      'Esoger Engineering Solutions Limited',
                      style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w600,
                        fontFamily: "Work Sans",
                        color: Color(0XFF561505),
                      ),
                      textAlign: TextAlign.center,
                    ),
                    SizedBox(height: 8),
                    Text(
                      'RC721281',
                      style: TextStyle(
                        fontSize: 12,
                        fontFamily: "Work Sans",
                        color: Colors.black54,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 40),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildSection(
    String title,
    String content, {
    List<String>? bulletPoints,
    Widget? customContent,
  }) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 24.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: const TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w700,
              fontFamily: "Work Sans",
              color: Color(0XFF561505),
            ),
          ),
          const SizedBox(height: 12),
          if (content.isNotEmpty)
            Text(
              content,
              style: const TextStyle(
                fontSize: 13,
                fontFamily: "Work Sans",
                color: Colors.black87,
                height: 1.6,
              ),
            ),
          if (bulletPoints != null) ...[
            const SizedBox(height: 8),
            ...bulletPoints.map((point) => Padding(
                  padding: const EdgeInsets.only(bottom: 8.0, left: 16.0),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        '• ',
                        style: TextStyle(
                          fontSize: 13,
                          fontFamily: "Work Sans",
                          color: Color(0XFF561505),
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Expanded(
                        child: Text(
                          point,
                          style: const TextStyle(
                            fontSize: 13,
                            fontFamily: "Work Sans",
                            color: Colors.black87,
                            height: 1.6,
                          ),
                        ),
                      ),
                    ],
                  ),
                )),
          ],
          if (customContent != null) ...[
            const SizedBox(height: 8),
            customContent,
          ],
        ],
      ),
    );
  }

  Widget _buildNumberedPoint(String number, String content) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 12.0, left: 16.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 2),
            decoration: BoxDecoration(
              color: const Color(0XFF561505).withOpacity(0.1),
              borderRadius: BorderRadius.circular(4),
            ),
            child: Text(
              number,
              style: const TextStyle(
                fontSize: 12,
                fontFamily: "Work Sans",
                color: Color(0XFF561505),
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Text(
              content,
              style: const TextStyle(
                fontSize: 13,
                fontFamily: "Work Sans",
                color: Colors.black87,
                height: 1.6,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
