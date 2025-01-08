// import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class profilelayout extends StatelessWidget {
  const profilelayout({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Profile Page'),
          backgroundColor: Colors.orange,
          centerTitle: true,
        ),
        body: Column(
          children: [
            Container(
              width: double.infinity,
              height: 150,
              color: Colors.blue,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    decoration: BoxDecoration(
                        shape: BoxShape.circle, color: Colors.white),
                    height: 80,
                    width: 80,
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Text(
                    'User Name',
                    style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 15),
                  )
                ],
              ),
            ),
            Container(
              padding: EdgeInsets.all(25),
              child: Column(
                children: [
                  SizedBox(
                    height: 10,
                  ),
                  Row(
                    children: [
                      Icon(
                        Icons.email,
                        color: Colors.lightBlue,
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      Text('user@example.com'),
                    ],
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Row(
                    children: [
                      Icon(
                        Icons.phone,
                        color: Colors.lightBlue,
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      Text('123-456-7890'),
                    ],
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Row(
                    children: [
                      Icon(
                        Icons.location_on,
                        color: Colors.lightBlue,
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      Text('123 Mainstreet'),
                    ],
                  )
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.only(
                  top: MediaQuery.of(context).size.height * 0.45),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Container(
                    child: ElevatedButton(
                        onPressed: () {}, child: Text('Edit Profile')),
                  ),
                  Container(
                    child:
                        ElevatedButton(onPressed: () {}, child: Text('Logout')),
                  )
                ],
              ),
            )
          ],
        ));
  }
}
