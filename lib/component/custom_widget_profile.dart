import 'package:flutter/material.dart';

class Profilecard extends StatelessWidget {
  final String name;
  final String position;
  final String email;
  final String phoneNumber;
  final String imageurl;

  const Profilecard(
      {super.key,
      required this.name,
      required this.position,
      required this.email,
      required this.phoneNumber,
      required this.imageurl});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Container(
      padding: const EdgeInsets.all(16),
      height: 260,
      width: double.infinity,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: theme.brightness == Brightness.dark
            ? Color.fromARGB(255, 36, 36, 56)
            : Colors.white, // Adapt background color
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.2),
            spreadRadius: 2,
            blurRadius: 8,
            offset: Offset(1, 2),
          ),
        ],
      ),
      child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
        CircleAvatar(
          backgroundImage: NetworkImage(imageurl),
          radius: 40,
        ),
        SizedBox(height: 8),
        Text(
          name,
          style: TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.bold,
            color: theme.brightness == Brightness.dark
                ? Colors.white
                : Colors.black, // Adapt text color
          ),
        ),
        Text(
          position,
          style: TextStyle(
            color: theme.brightness == Brightness.dark
                ? Colors.white70
                : Colors.grey, // Adapt text color
          ),
        ),
        SizedBox(
          height: 10,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              Icons.email,
              color: theme.brightness == Brightness.dark
                  ? Colors.blueAccent
                  : Colors.blue,
            ),
            SizedBox(
              width: 10,
            ),
            Text(
              email,
              style: TextStyle(
                color: theme.brightness == Brightness.dark
                    ? Colors.white
                    : Colors.black,
              ),
            ),
          ],
        ),
        SizedBox(
          height: 10,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              Icons.phone,
              color: theme.brightness == Brightness.dark
                  ? Colors.green
                  : Colors.green[400],
            ),
            SizedBox(width: 10),
            Text(
              phoneNumber,
              style: TextStyle(
                color: theme.brightness == Brightness.dark
                    ? Colors.white
                    : Colors.black,
              ),
            ),
          ],
        ),
      ]),
    );
  }
}
