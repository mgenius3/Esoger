import 'package:esoger/ui/theme/colors.dart';
import 'package:flutter/material.dart';
import 'package:esoger/ui/widget/button/primarybutton.dart';
import 'package:go_router/go_router.dart';

class TermsAndConditionsScreen extends StatelessWidget {
  final ScrollController _scrollController = ScrollController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: const EdgeInsets.all(30.0),
        margin: const EdgeInsets.only(top: 50),
        child: Column(
          children: [
            const Text(
              'Policies, Terms and Conditions of Service or Use of the Esoger Platform and its App',
              style: TextStyle(
                  fontSize: 20,
                  color: Color(0XFF948F94),
                  fontFamily: "Work Sans"),
            ),
            const SizedBox(height: 30),
            Expanded(
              child: SingleChildScrollView(
                controller: _scrollController,
                child: const Text(
                  '''1. Introduction - Welcome to esoger.com and its app. Esoger is a registered business in Nigeria under the aegis of Esoger Engineering Solutions Limited, RC721281 as a peer-to-peer platform for exchanging proven technical design engineering solutions by way of interactive workbooks or calculators in the oil, gas and petrochemical industries. These workbooks or calculators are detailed engineered series of programmed calculations transcribed into useable interactive online templates for other engineers to use to quickly take design decisions on major mechanical units and simple systems as piping as well. These interactive workbooks cover such systems as Production Separators, Pumps, Compressors, Heat Exchangers, Distillation Columns, Piping and Valuation interactive templates towards conducting easily and quickly cost benefit analysis of two or more capital intensive projects like Refineries, Liquefied Petroleum Gas Plants, Liquefied Natural Gas Plants, Floating Production Storage Offloading Units, Metallurgical or Petrochemical Plants. These workbooks have been developed using global best technical guidelines and practices and they serve basically the purpose of facilitating design
                  Introduction - Welcome to esoger.com and its app. Esoger is a registered business in Nigeria under the aegis of Esoger Engineering Solutions Limited, RC721281 as a peer-to-peer platform for exchanging proven technical design engineering solutions by way of interactive workbooks or calculators in the oil, gas and petrochemical industries. These workbooks or calculators are detailed engineered series of programmed calculations transcribed into useable interactive online templates for other engineers to use to quickly take design decisions on major mechanical units and simple systems as piping as well. These interactive workbooks cover such systems as Production Separators, Pumps, Compressors, Heat Exchangers, Distillation Columns, Piping and Valuation interactive templates towards conducting easily and quickly cost benefit analysis of two or more capital intensive projects like Refineries, Liquefied Petroleum Gas Plants, Liquefied Natural Gas Plants, Floating Production Storage Offloading Units, Metallurgical or Petrochemical Plants. These workbooks have been developed using global best technical guidelines and practices and they serve basically the purpose of facilitating design.Introduction - Welcome to esoger.com and its app. Esoger is a registered business in Nigeria under the aegis of Esoger Engineering Solutions Limited, RC721281 as a peer-to-peer platform for exchanging proven technical design engineering solutions by way of interactive workbooks or calculators in the oil, gas and petrochemical industries. These workbooks or calculators are detailed engineered series of programmed calculations transcribed into useable interactive online templates for other engineers to use to quickly take design decisions on major mechanical units and simple systems as piping as well. These interactive workbooks cover such systems as Production Separators, Pumps, Compressors, Heat Exchangers, Distillation Columns, Piping and Valuation interactive templates towards conducting easily and quickly cost benefit analysis of two or more capital intensive projects like Refineries, Liquefied Petroleum Gas Plants, Liquefied Natural Gas Plants, Floating Production Storage Offloading Units, Metallurgical or Petrochemical Plants. These workbooks have been developed using global best technical guidelines and practices and they serve basically the purpose of facilitating design.Introduction - Welcome to esoger.com and its app. Esoger is a registered business in Nigeria under the aegis of Esoger Engineering Solutions Limited, RC721281 as a peer-to-peer platform for exchanging proven technical design engineering solutions by way of interactive workbooks or calculators in the oil, gas and petrochemical industries. These workbooks or calculators are detailed engineered series of programmed calculations transcribed into useable interactive online templates for other engineers to use to quickly take design decisions on major mechanical units and simple systems as piping as well. These interactive workbooks cover such systems as Production Separators, Pumps, Compressors, Heat Exchangers, Distillation Columns, Piping and Valuation interactive templates towards conducting easily and quickly cost benefit analysis of two or more capital intensive projects like Refineries, Liquefied Petroleum Gas Plants, Liquefied Natural Gas Plants, Floating Production Storage Offloading Units, Metallurgical or Petrochemical Plants. These workbooks have been developed using global best technical guidelines and practices and they serve basically the purpose of facilitating designIntroduction - Welcome to esoger.com and its app. Esoger is a registered business in Nigeria under the aegis of Esoger Engineering Solutions Limited, RC721281 as a peer-to-peer platform for exchanging proven technical design engineering solutions by way of interactive workbooks or calculators in the oil, gas and petrochemical industries. These workbooks or calculators are detailed engineered series of programmed calculations transcribed into useable interactive online templates for other engineers to use to quickly take design decisions on major mechanical units and simple systems as piping as well. These interactive workbooks cover such systems as Production Separators, Pumps, Compressors, Heat Exchangers, Distillation Columns, Piping and Valuation interactive templates towards conducting easily and quickly cost benefit analysis of two or more capital intensive projects like Refineries, Liquefied Petroleum Gas Plants, Liquefied Natural Gas Plants, Floating Production Storage Offloading Units, Metallurgical or Petrochemical Plants. These workbooks have been developed using global best technical guidelines and practices and they serve basically the purpose of facilitating design..
                  ...''',
                  style: TextStyle(
                      fontSize: 16,
                      color: Color(0XFF948F94),
                      fontFamily: "Work Sans"),
                ),
              ),
            ),
            SizedBox(
              width: 150,
              height: 35,
              child: CustomPrimaryButton(
                onPressed: () {
                  _scrollController.animateTo(
                    _scrollController.position.maxScrollExtent,
                    duration: Duration(seconds: 1),
                    curve: Curves.easeInOut,
                  );
                },
                text: "Scroll to Bottom",
                textcolor: primaryColor,
                color: Colors.white,
                border: true,
              ),
            ),
            const SizedBox(height: 20),
            SizedBox(
              width: 150,
              height: 35,
              child: CustomPrimaryButton(
                onPressed: () {
                  context.push('/signup');
                },
                text: "Accept T&C",
                textcolor: Colors.white,
              ),
            ),
            // Row(
            //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
            //   children: [
            //     ElevatedButton(
            //       onPressed: () {
            //         _scrollController.animateTo(
            //           _scrollController.position.maxScrollExtent,
            //           duration: Duration(seconds: 1),
            //           curve: Curves.easeInOut,
            //         );
            //       },
            //       child: Text('Scroll to Bottom'),
            //     ),
            //     ElevatedButton(
            //       onPressed: () {
            //         _scrollController.animateTo(
            //           _scrollController.position.minScrollExtent,
            //           duration: Duration(seconds: 1),
            //           curve: Curves.easeInOut,
            //         );
            //       },
            //       child: Text('Scroll to Top'),
            //     ),
            //   ],
            // ),
            // SizedBox(height: 16),
            // ElevatedButton(
            //   style: ElevatedButton.styleFrom(
            //     primary: Colors.orange,
            //   ),
            //   onPressed: () {
            //     // Handle the Accept T&C logic here
            //   },
            //   child: Text('Accept T&C'),
            // ),
          ],
        ),
      ),
    );
  }
}
