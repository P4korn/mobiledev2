import 'package:flutter/material.dart';
import 'package:mobiledev2/component/custom_widget_profile.dart';

class ProfilePageCard extends StatelessWidget {
  final VoidCallback toggleTheme;
  final bool isDarkMode;

  const ProfilePageCard(
      {super.key, required this.toggleTheme, required this.isDarkMode});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Theme Example"),
        centerTitle: true,
        actions: [
          IconButton(
            icon: Icon(isDarkMode ? Icons.light_mode : Icons.dark_mode),
            onPressed: toggleTheme,
          )
        ],
      ),
      body: Center(
        child: Profilecard(
          name: 'Pakorn Surakarnkul',
          position: 'WaterBoi',
          email: 'ohmeiei@gmail.com',
          phoneNumber: '0882719273',
          imageurl:
              'https://gratisography.com/wp-content/uploads/2024/11/gratisography-augmented-reality-800x525.jpg',
        ),
      ),
    );
  }
}
