import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

Widget myPlanPackages(String plan) {
  print(plan);
  final Map data = {
    "name": "gold package",
    "note": "best deal",
    "price": "\$5",
    "price_note": "Per month",
    "no": 1
  };

  return Container(
    margin: const EdgeInsets.only(right: 10, top: 10),
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(16),
      gradient: LinearGradient(
        begin: Alignment.topLeft,
        end: Alignment.bottomRight,
        colors: data['no'] == 1
            ? [const Color(0XFF200802), const Color(0XFF3A1004)]
            : data['no'] == 2
                ? [Colors.black, const Color(0XFF1A1A1A)]
                : [const Color(0XFF460909), const Color(0XFF6B0D0D)],
      ),
      boxShadow: [
        BoxShadow(
          color: Colors.black.withOpacity(0.2),
          blurRadius: 12,
          offset: const Offset(0, 6),
        ),
      ],
    ),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Header Section with gradient overlay
        Container(
          padding: const EdgeInsets.all(16),
          decoration: BoxDecoration(
            borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(16),
              topRight: Radius.circular(16),
            ),
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [
                Colors.white.withOpacity(0.05),
                Colors.transparent,
              ],
            ),
          ),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: List.generate(data['no'], (i) {
                  return Padding(
                    padding: const EdgeInsets.only(right: 6.0),
                    child: SvgPicture.asset(
                      'public/svg/gold_badge.svg',
                      width: 28,
                      height: 28,
                    ),
                  );
                }),
              ),
              const SizedBox(width: 16),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      plan.toString().toUpperCase() + ' ' + 'PACKAGE',
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 16,
                        fontFamily: "Work Sans",
                        fontWeight: FontWeight.w700,
                        letterSpacing: 0.5,
                      ),
                    ),
                    const SizedBox(height: 6),
                    Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 10,
                        vertical: 4,
                      ),
                      decoration: BoxDecoration(
                        color: Colors.amber.withOpacity(0.2),
                        borderRadius: BorderRadius.circular(12),
                        border: Border.all(
                          color: Colors.amber.withOpacity(0.3),
                          width: 1,
                        ),
                      ),
                      child: Text(
                        data['note'],
                        style: const TextStyle(
                          color: Colors.amber,
                          fontSize: 10,
                          fontFamily: "Work Sans",
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),

        // Divider with gradient
        Container(
          height: 1,
          margin: const EdgeInsets.symmetric(horizontal: 16),
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [
                Colors.transparent,
                const Color(0XFFFFFFFF4D),
                Colors.transparent,
              ],
            ),
          ),
        ),

        // Features Section
        Padding(
          padding: const EdgeInsets.all(16),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                padding: const EdgeInsets.all(8),
                decoration: BoxDecoration(
                  color: Colors.white.withOpacity(0.1),
                  borderRadius: BorderRadius.circular(8),
                ),
                child: SvgPicture.asset(
                  'public/svg/chat.svg',
                  width: 20,
                  height: 20,
                ),
              ),
              const SizedBox(width: 12),
              Expanded(
                child: Text(
                  'Access to any eight(${plan == "diamond" ? "9" : plan == "gold" ? "12" : "17"}) E-engineering  Workbook',
                  style: TextStyle(
                    fontFamily: "Work Sans",
                    fontSize: 12,
                    color: Colors.white.withOpacity(0.9),
                    height: 1.5,
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ),
            ],
          ),
        ),

        // Bottom divider
        Container(
          height: 1,
          margin: const EdgeInsets.symmetric(horizontal: 16),
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [
                Colors.transparent,
                const Color(0XFFFFFFFF4D),
                Colors.transparent,
              ],
            ),
          ),
        ),
        const SizedBox(height: 4),
      ],
    ),
  );
}
