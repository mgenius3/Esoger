import 'package:flutter/material.dart';
import 'package:esoger/ui/widget/button/back_navigation.dart';
import "package:esoger/ui/theme/colors.dart";
import 'package:esoger/ui/widget/button/primarybutton.dart';
import 'package:go_router/go_router.dart';
import 'dart:async';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:fluttertoast/fluttertoast.dart';

class ForgotPassword extends StatefulWidget {
  final String method;

  const ForgotPassword({required this.method});

  @override
  State<ForgotPassword> createState() => _ForgotPasswordState();
}

class _ForgotPasswordState extends State<ForgotPassword> {
  final _formkey = GlobalKey<FormState>();
  bool _isLoading = false;

  final _1Controller = TextEditingController();
  final _2Controller = TextEditingController();
  final _3Controller = TextEditingController();
  final _4Controller = TextEditingController();
  final _5Controller = TextEditingController();
  final _6Controller = TextEditingController();

  int focus = 1;

  bool checkIfInputFieldIsComplete = false;
  int _secondsRemaining = 45; // Initial countdown time in seconds
  late Timer _timer;

  List<String> pinValues = ['', '', '', '', '', ''];
  List<FocusNode> focusNodes = List.generate(6, (index) => FocusNode());

  void updatePinValue(int index, String value) {
    setState(() {
      pinValues[index] = value;
      if (value.isNotEmpty) {
        if (index < 5) {
          focusNodes[index + 1].requestFocus();
        }
      }
    });
  }

  bool codeVerified = false;
  bool? isPinComplete() {
    for (String value in pinValues) {
      if (value.isEmpty) {
        return false;
      }
    }
  }

  @override
  void dispose() {
    for (var node in focusNodes) {
      node.dispose();
    }
    super.dispose();
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    countdowntimer();
  }

  bool validateForm() {
    return _formkey.currentState!.validate();
  }

  countdowntimer() {
    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      setState(() {
        if (_secondsRemaining > 0) {
          setState(() {
            _secondsRemaining--;
          });
        } else {
          _timer.cancel(); // Stop the timer when countdown reaches 0
          countdowntimer();
          setState(() {
            // resendemailcode = true;
            _secondsRemaining = 45;
          });
        }
      });
    });
  }

  nextBox() {
    if (focus < 6) {
      setState(() {
        focus = focus + 1;
      });
      print(focus);
    }
  }

  prevBox() {
    if (focus > 1) {
      setState(() {
        focus = focus - 1;
      });

      print(focus);
    }
  }

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    // Format the remaining time as minutes:seconds
    String formattedTime =
        '${(_secondsRemaining ~/ 60).toString().padLeft(2, '0')}:${(_secondsRemaining % 60).toString().padLeft(2, '0')}';

    Widget codeBox(TextEditingController controller, int focusnumber) {
      return SizedBox(
        width: width > 500 ? 54 : width * 0.12,
        height: 54,
        child: TextFormField(
          keyboardType: TextInputType.phone,
          obscureText: true,
          autofocus: true,
          focusNode: focusNodes[focusnumber],
          controller: controller,
          decoration: InputDecoration(
              fillColor: Colors.white,
              filled: true,
              enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8.0),
                  borderSide:
                      const BorderSide(color: Color(0xFFD3D3D3), width: 1.0)),
              contentPadding: const EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
              border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8.0),
                  borderSide:
                      const BorderSide(color: primaryColor, width: 1.0))),
          autovalidateMode: AutovalidateMode.onUserInteraction,
          onChanged: (value) {
            final boolvalue = validateForm();
            updatePinValue(focusnumber, value);
            setState(() {
              checkIfInputFieldIsComplete = boolvalue;
            });
            isPinComplete();
          },
        ),
        // )
      );
    }

    return Scaffold(
      backgroundColor: codeVerified ? Colors.grey : Colors.white,
      body: Container(
        width: width,
        padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 80),
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          SizedBox(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                backNavigation(context),
                Center(
                    child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(height: 20),
                    const Text(
                      "Forgot Password?",
                      style: TextStyle(
                          fontFamily: 'Work Sans',
                          fontWeight: FontWeight.w600,
                          fontSize: 26,
                          color: Color(0XFF494949)),
                    ),
                    const SizedBox(height: 10),
                    widget.method == "sms"
                        ? const Text(
                            "Don’t worry! it happens. Enter the security code we sent to +32 9077594551",
                            style: TextStyle(
                                fontFamily: 'Work Sans',
                                fontWeight: FontWeight.w400,
                                fontSize: 14),
                          )
                        : const Text(
                            "Don’t worry! it happens. Enter the security code we sent to benmos16@gmail.com",
                            style: TextStyle(
                                fontFamily: 'Work Sans',
                                fontWeight: FontWeight.w400,
                                fontSize: 14),
                          ),
                    const SizedBox(height: 20),
                    Form(
                        key: _formkey,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            codeBox(_1Controller, 0),
                            codeBox(_2Controller, 1),
                            codeBox(_3Controller, 2),
                            codeBox(_4Controller, 3),
                            codeBox(_5Controller, 4),
                            codeBox(_6Controller, 5)
                          ],
                        )),
                    const SizedBox(height: 20),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            const Text(
                              "Didn't get the code? ",
                              style: TextStyle(fontSize: 14),
                            ),
                            GestureDetector(
                              onTap: () {},
                              child: const Text(
                                'Resend it',
                                style: TextStyle(color: primaryColor),
                              ),
                            )
                          ],
                        ),
                        Row(
                          children: [
                            SvgPicture.asset('public/svg/countdown.svg'),
                            Text(
                              _secondsRemaining.toString(),
                              style: const TextStyle(fontSize: 14),
                            )
                          ],
                        )
                      ],
                    )
                  ],
                ))
              ],
            ),
          ),
          const SizedBox(height: 100),
          SizedBox(
            child: checkIfInputFieldIsComplete
                ? CustomPrimaryButton(
                    onPressed: () {
                      context.push("/createloginpassword");
                    },
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
                            "Continue",
                            style: TextStyle(color: Colors.white),
                          ),
                  )
                : CustomPrimaryButton(
                    onPressed: () {},
                    color: secondaryColor,
                    child: const Text(
                      "Continue",
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
          ),
        ]),
      ),
    );
  }
}
