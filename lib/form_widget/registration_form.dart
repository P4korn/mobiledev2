import 'package:flutter/material.dart';

class RegistrationForm extends StatefulWidget {
  const RegistrationForm({super.key});

  @override
  State<RegistrationForm> createState() => _RegistrationFormState();
}

class _RegistrationFormState extends State<RegistrationForm> {
  final _formKey = GlobalKey<FormState>();
  String? _gender;
  String? _selectedItem;
  bool _isChecked = false;

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text("Registration Form (640710552)"),
        centerTitle: true,
      ),
      body: Form(
        key: _formKey,
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            children: [
              TextFormField(
                decoration: const InputDecoration(labelText: "Full Name"),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter your Nme';
                  }
                },
                onChanged: (value) => print(value),
              ),
              SizedBox(
                height: 10,
              ),
              TextFormField(
                decoration: const InputDecoration(labelText: "Email"),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter your Email';
                  }
                  return null;
                },
                onChanged: (value) => print(value),
              ),
              SizedBox(
                height: 15,
              ),
              Container(
                width: double.infinity,
                child: Text(
                  "Gender",
                  style: TextStyle(fontSize: 15),
                ),
              ),
              Row(
                children: [
                  Expanded(
                    child: RadioListTile(
                      title: const Text("Male"),
                      value: 'Male',
                      groupValue: _gender,
                      onChanged: (value) {
                        setState(() {
                          _gender = value.toString();
                        });
                      },
                    ),
                  ),
                  Expanded(
                      child: RadioListTile(
                    title: const Text("Female"),
                    value: 'Female',
                    groupValue: _gender,
                    onChanged: (value) {
                      setState(() {
                        _gender = value.toString();
                      });
                    },
                  )),
                ],
              ),
              SizedBox(
                height: 10,
              ),
              DropdownButtonFormField<String>(
                decoration: const InputDecoration(labelText: "Province"),
                value: _selectedItem,
                items: ["Bangkok", "Phuket", "ChiangMai", "KhonKaen"]
                    .map((item) => DropdownMenuItem(
                          child: Text(item),
                          value: item,
                        ))
                    .toList(),
                onChanged: (value) =>
                    value == null ? 'Please select an option' : null,
              ),
              SizedBox(height: 10),
              CheckboxListTile(
                  title: const Text("Accept Term & Conditions"),
                  value: _isChecked,
                  onChanged: (value) {
                    setState(() {
                      _isChecked = value!;
                    });
                  }),
              SizedBox(
                height: 10,
              ),
              ElevatedButton(
                  onPressed: () {
                    if (_formKey.currentState!.validate()) ;
                  },
                  child: Text("Submit"))
            ],
          ),
        ),
      ),
    );
  }
}
