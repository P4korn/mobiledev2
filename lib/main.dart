import 'package:flutter/material.dart';
import 'package:mobiledev2/Api_/air_quality_page.dart';
import 'package:mobiledev2/animate_pratice/traffic_light.dart';
import 'package:mobiledev2/component/custom_card_page.dart';
import 'package:mobiledev2/component/custome_profile_page.dart';
import 'package:mobiledev2/component/theme.dart';
import 'package:mobiledev2/form_widget/registration_form.dart';
import 'page_answer/answer_portal.dart';
import 'form_widget/form_simple.dart';
import 'Api_/product_list.dart';
import 'firebase_demo/firebase_store_demo.dart';
import 'package:firebase_core/firebase_core.dart';

void main() {
  // WidgetsFlutterBinding.ensureInitialized();
  // await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  bool isDarkMode = false;

  void toggleTheme() {
    setState(() {
      isDarkMode = !isDarkMode;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: isDarkMode ? AppThemes.darkTheme : AppThemes.lightTheme,
      home: Trafficlight(
        toggleTheme: toggleTheme,
        isDarkMode: isDarkMode,
      ),
    );
  }
}
