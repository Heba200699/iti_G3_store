import 'package:flutter/material.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  bool notifications = true;



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,

      // App Bar
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        centerTitle: true,
        title: const Text(
          'Profile',
          style: TextStyle(
            color: Color(0xffFF5E00),
            fontSize: 24,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),

      // Body
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 35),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 20),

            // Edit Profile
            buildItem(
              Icons.person,
              'Edit Profile',
            ),

            // Change Password
            buildItem(
              Icons.key,
              'Change Password',
            ),

            // My Cards
            buildItem(
              Icons.credit_card,
              'My Cards',
            ),

            const SizedBox(height: 5),

            // App Settings
            const Text(
              'App Settings',
              style: TextStyle(
                color: Color(0xffFF5E00),
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),

            const SizedBox(height: 20),

            // Notifications
            Row(
              children: [
                Icon(
                  Icons.notifications,
                  color: Color(0xff804F1E),
                  size: 25,
                ),

                const SizedBox(width: 15),

                Expanded(
                  child: Text(
                    'Notifications',
                    style: TextStyle(
                      fontSize: 16,
                      color: Color(0xff804F1E),
                    ),
                  ),
                ),

                Switch(
                  value: notifications,
                  activeThumbColor: Colors.white,
                  activeTrackColor: Colors.orange,
                  inactiveThumbColor: Colors.white,
                  inactiveTrackColor: Colors.grey.shade300,
                  onChanged: (value) {
                    setState(() {
                      notifications = value;
                    });
                  },
                ),
              ],
            ),

            const SizedBox(height: 20),

            // Language
            Row(
              children: [
                Icon(
                  Icons.translate,
                  color: Color(0xff804F1E),
                  size: 25,
                ),

                const SizedBox(width: 15),

                Expanded(
                  child: Text(
                    'Language',
                    style: TextStyle(
                      fontSize: 16,
                      color: Color(0xff804F1E),
                    ),
                  ),
                ),

                Text(
                  'English',
                  style: TextStyle(
                    fontSize: 15,
                    color: Color(0xff804F1E),
                  ),
                ),

                Icon(
                  Icons.chevron_right,
                  color: Color(0xff804F1E),
                ),
              ],
            ),

            const SizedBox(height: 20),

            // Logout
            Row(
              children: [
                Icon(
                  Icons.logout,
                  color: Color(0xff804F1E),
                  size: 25,
                ),

                const SizedBox(width: 15),

                Text(
                  'Logout',
                  style: TextStyle(
                    fontSize: 16,
                    color: Color(0xff804F1E),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  // Reusable Profile Item
  Widget buildItem(
      IconData icon,
      String title,
      ) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 25),
      child: Row(
        children: [
          Icon(
            icon,
            color: Color(0xff804F1E),
            size: 25,
          ),

          const SizedBox(width: 15),

          Expanded(
            child: Text(
              title,
              style: TextStyle(
                fontSize: 16,
                color: Color(0xff804F1E),
              ),
            ),
          ),

          Icon(
            Icons.chevron_right,
            color: Color(0xff804F1E),
          ),
        ],
      ),
    );
  }
}