import 'package:flutter/material.dart';

class FormSimple extends StatefulWidget {
  const FormSimple({super.key});

  @override
  State<FormSimple> createState() => _FormSimpleState();
}

class _FormSimpleState extends State<FormSimple> {
  String? name = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Form Input"),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          TextFormField(
            decoration: const InputDecoration(
                labelText: 'Name',
                prefixIcon: Icon(Icons.person),
                hintText: "Name",
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(1.0)))),
            validator: (value) {
              if (value == null || value.isEmpty) {}
              return null;
            },
            onChanged: (value) {
              print(value);
              setState(() {
                name = value;
              });
            },
          ),
          SizedBox(
            height: 10,
          ),
          ElevatedButton(onPressed: () {}, child: const Text("Submit"))
        ],
      ),
    );
  }
}
