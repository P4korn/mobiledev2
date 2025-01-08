// import 'dart:ffi';

import 'package:flutter/material.dart';

class gridlayout extends StatelessWidget {
  const gridlayout({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Grid Layout'),
          backgroundColor: Colors.orange,
          centerTitle: true,
        ),
        body: Column(
          children: [
            SizedBox(
              height: 20,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  height: 100,
                  width: 100,
                  color: Colors.red,
                ),
                SizedBox(
                  width: 20,
                ),
                Container(
                  height: 100,
                  width: 100,
                  color: Colors.green,
                ),
                SizedBox(
                  width: 20,
                ),
                Container(
                  height: 100,
                  width: 100,
                  color: Colors.lightBlue,
                ),
                SizedBox(
                  width: 20,
                ),
              ],
            ),
            SizedBox(
              height: 20,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  height: 100,
                  width: 100,
                  color: Colors.orange,
                ),
                SizedBox(width: 20),
                Container(
                  height: 100,
                  width: 100,
                  color: Colors.purple,
                ),
                SizedBox(
                  width: 20,
                  height: 20,
                ),
                Container(
                  height: 100,
                  width: 100,
                  color: Colors.yellow,
                ),
                SizedBox(
                  width: 20,
                ),
              ],
            ),
          ],
        ));
  }
}
