import 'package:flutter/material.dart';
import 'package:mobiledev2/Api_/air_quality_page.dart';
import 'package:mobiledev2/form_widget/registration_form.dart';
import 'page_answer/answer_portal.dart';
import 'form_widget/form_simple.dart';
import 'Api_/product_list.dart';
import 'firebase_demo/firebase_store_demo.dart';

import 'package:firebase_core/firebase_core.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: ProductAPICall(),
    );
  }
}
