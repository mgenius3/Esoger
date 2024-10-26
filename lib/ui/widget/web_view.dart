import 'package:esoger/ui/widget/button/back_navigation.dart';
import 'package:esoger/ui/widget/equipment_design.dart';
import 'package:esoger/utils/format.dart';
import 'package:webview_flutter/webview_flutter.dart';
import 'package:flutter/material.dart';
import 'dart:convert';

void openWebView(BuildContext context, String url, String name, dynamic bytes) {
  double padding = 20; // Padding inside the Container

  final WebViewController controller = WebViewController()
    ..setJavaScriptMode(JavaScriptMode.unrestricted)
    ..loadRequest(Uri.parse(url));

  Navigator.push(
    context,
    MaterialPageRoute(
      builder: (context) => Scaffold(
        body: Padding(
          padding: EdgeInsets.all(padding),
          child: Column(
            children: [
              const SizedBox(height: 30),
              Row(
                children: [
                  backNavigation(context),
                  const SizedBox(width: 20),
                  Text(
                    shortenText(name, 30),
                    style: const TextStyle(fontFamily: "Work Sans"),
                  ),
                ],
              ),
              const SizedBox(height: 20),
              SizedBox(
                // width: 200,
                child: Image.memory(bytes),
              ),
              const SizedBox(height: 20),
              Expanded(
                child: WebViewWidget(controller: controller),
              ),
            ],
          ),
        ),
      ),
    ),
  );
}
