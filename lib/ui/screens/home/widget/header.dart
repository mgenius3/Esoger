import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

Widget header(String username) {
  // Get the time-based greeting
  String getGreeting() {
    final hour = DateTime.now().hour;
    if (hour < 12) {
      return 'Good Morning';
    } else if (hour < 17) {
      return 'Good Afternoon';
    } else if (hour < 21) {
      return 'Good Evening';
    } else {
      return 'Good Night';
    }
  }

  // Get the emoji based on time
  String getGreetingEmoji() {
    final hour = DateTime.now().hour;
    if (hour < 12) {
      return '☀️';
    } else if (hour < 17) {
      return '🌤️';
    } else if (hour < 21) {
      return '🌆';
    } else {
      return '🌙';
    }
  }

  return Container(
    padding: const EdgeInsets.symmetric(vertical: 8),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          children: [
            // Modern avatar container
            Container(
              width: 52,
              height: 52,
              decoration: BoxDecoration(
                gradient: const LinearGradient(
                  colors: [Color.fromARGB(255, 186, 77, 43), Color.fromARGB(255, 211, 63, 9)],
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                ),
                borderRadius: BorderRadius.circular(16),
                boxShadow: [
                  BoxShadow(
                    color: const Color.fromARGB(255, 148, 60, 42).withOpacity(0.3),
                    blurRadius: 12,
                    offset: const Offset(0, 4),
                  ),
                ],
              ),
              child: const Icon(
                Icons.person,
                color: Colors.white,
                size: 28,
              ),
            ),
            const SizedBox(width: 14),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Row(
                  children: [
                    Text(
                      '${getGreeting()}, ',
                      style: const TextStyle(
                        fontFamily: "Work Sans",
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                        color: Color(0xFF8C8C8C),
                        letterSpacing: 0.2,
                      ),
                    ),
                    Text(
                      username,
                      style: const TextStyle(
                        fontFamily: "Work Sans",
                        fontSize: 16,
                        fontWeight: FontWeight.w700,
                        color: Color(0xFF2C2C2C),
                        letterSpacing: 0.2,
                      ),
                    ),
                    const SizedBox(width: 6),
                    Text(
                      getGreetingEmoji(),
                      style: const TextStyle(fontSize: 16),
                    ),
                  ],
                ),
                const SizedBox(height: 4),
                Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 8,
                    vertical: 4,
                  ),
                  decoration: BoxDecoration(
                    color: const Color(0xFF6C63FF).withOpacity(0.08),
                    borderRadius: BorderRadius.circular(6),
                  ),
                  child: const Text(
                    'Find your lesson today',
                    style: TextStyle(
                      fontSize: 13,
                      fontFamily: "Work Sans",
                      fontWeight: FontWeight.w500,
                      color: Color.fromARGB(255, 177, 64, 64),
                      letterSpacing: 0.1,
                    ),
                  ),
                ),
              ],
            )
          ],
        ),
        const SizedBox()
      ],
    ),
  );
}