// import 'dart:ffi';

import 'package:flutter/material.dart';

class socialmedia extends StatelessWidget {
  const socialmedia({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Social Media Post'),
          backgroundColor: Colors.orange,
          centerTitle: true,
        ),
        body: Column(
          children: [
            Row(
              children: [
                Container(
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: Colors.lightBlue,
                  ),
                  height: 50,
                  width: 50,
                  margin: EdgeInsets.all(20),
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('User Name',
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 20)),
                    Text(
                      '5 minutes ago',
                      style: TextStyle(
                          fontWeight: FontWeight.normal, color: Colors.grey),
                    )
                  ],
                ),
              ],
            ),
            Container(
              color: Colors.blueGrey,
              width: double.infinity,
              height: 200,
            ),
            SizedBox(
              height: 20,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Container(
                    child:
                        ElevatedButton(onPressed: () {}, child: Text('Like'))),
                Container(
                    child: ElevatedButton(
                        onPressed: () {}, child: Text('Comment'))),
                Container(
                    child:
                        ElevatedButton(onPressed: () {}, child: Text('Share'))),
              ],
            )
          ],
        ));
  }
}
