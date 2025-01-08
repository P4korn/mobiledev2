import 'package:flutter/material.dart';
import 'package:mobiledev2/page_answer/answer1.dart';
import 'package:mobiledev2/page_answer/answer2.dart';
import 'package:mobiledev2/page_answer/answer3.dart';
import 'package:mobiledev2/page_answer/answer4.dart';

class portal extends StatelessWidget {
  const portal({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('My Answer'),
        backgroundColor: Colors.orange,
        centerTitle: true,
      ),
      backgroundColor: Color(0xFFEAF6F6),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          spacing: 10,
          children: [
            Answerbutton(text: 'Answer1', target_page: gridlayout()),
            Answerbutton(text: 'Answer2', target_page: socialmedia()),
            Answerbutton(text: 'Answer3', target_page: productlayout()),
            Answerbutton(text: 'Answer4', target_page: profilelayout())
          ],
        ),
      ),
    );
  }
}

class Answerbutton extends StatelessWidget {
  final String text;
  final Widget target_page;

  const Answerbutton(
      {required this.text, required this.target_page, super.key});
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
        onPressed: () {
          Navigator.push(
              context, MaterialPageRoute(builder: (context) => target_page));
        },
        child: Text(text));
  }
}
