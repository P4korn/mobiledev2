import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:mobiledev2/model/user_data.dart';

class SimpleApiCall extends StatefulWidget {
  const SimpleApiCall({super.key});

  @override
  State<SimpleApiCall> createState() => _SimpleApiCallState();
}

class _SimpleApiCallState extends State<SimpleApiCall> {
  List<UserData> users = [];

  Future<void> fetchData() async {
    try {
      var response = await http
          .get(Uri.parse('https://jsonplaceholder.typicode.com/users/'));
      if (response.statusCode == 200) {
        List<dynamic> jsonList = jsonDecode(response.body);
        setState(() {
          users = jsonList.map((item) => UserData.fromJson(item)).toList();
        });

        for (var user in users) {
          print("ID: ${user.id},Name: ${user.name},Email: ${user.email}");
        }
      } else {
        print("Invalid Data");
      }
    } catch (e) {
      print(e);
    }
  }

  @override
  void initState() {
    super.initState();
    fetchData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Simple API Call"),
        backgroundColor: Colors.purple,
      ),
      body: ListView.separated(
          itemBuilder: (BuildContext context, int index) {
            return ListTile(
              leading: Text('${users[index].id}'),
              title: Text(users[index].name),
              subtitle: Text(users[index].email),
              trailing: Text('(${users[index].username})'),
            );
          },
          separatorBuilder: (BuildContext context, int index) =>
              const Divider(),
          itemCount: users.length),
    );
  }
}
