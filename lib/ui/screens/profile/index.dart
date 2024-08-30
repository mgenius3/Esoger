import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class UserProfileScreen extends StatefulWidget {
  @override
  _UserProfileScreenState createState() => _UserProfileScreenState();
}

class _UserProfileScreenState extends State<UserProfileScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(height: 50), // Top spacing
            const CircleAvatar(
              radius: 50,
              backgroundImage: AssetImage(
                  'public/images/Male profile avatar.jpeg'), // Replace with actual image URL
            ),
            SizedBox(height: 10),
            Text(
              'Jarel Samson',
              style: TextStyle(
                fontSize: 22,
                fontFamily: "Work Sans",
                fontWeight: FontWeight.bold,
              ),
            ),
            Text(
              'jarelsamson@gmail.com',
              style: TextStyle(
                fontSize: 14,
                fontFamily: "Work Sans",
                color: Colors.grey,
              ),
            ),
            SizedBox(height: 30),
            Expanded(
              child: ListView(
                children: [
                  _buildProfileOption(
                      Icons.person_outline, "About me", 'aboutme'),
                  // _buildProfileOption(
                  //     Icons.credit_card, "Credit Card", 'creditcard'),

                  _buildProfileOption(
                      Icons.lock_outline, "Password", "setnewpassword"),
                  _buildProfileOption(
                      Icons.history, "Transactions", "transactions"),
                  // _buildProfileOption(Icons.notifications_outlined,
                  //     "Notifications", "notifications"),
                ],
              ),
            ),
            ListTile(
              leading: Icon(Icons.logout, color: Colors.red),
              title: const Text(
                'Sign out',
                style: TextStyle(
                  color: Colors.red,
                  fontFamily: "Work Sans",
                ),
              ),
              onTap: () {
                context.go("/signin");
              },
            ),
            const SizedBox(height: 20),
          ],
        ),
      ),
    );
  }

  Widget _buildProfileOption(IconData icon, String title, String routes) {
    return ListTile(
      leading: Icon(icon, color: Colors.red),
      title: Text(
        title,
        style: const TextStyle(fontFamily: "Work Sans"),
      ),
      trailing: Icon(Icons.arrow_forward_ios),
      onTap: () {
        context.push('/$routes');
      },
    );
  }
}
