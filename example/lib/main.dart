import 'package:flutter/material.dart';
import 'package:great_form/additional_forms/scrollable_form.dart';
import 'package:great_form/form_field/great_form_field.dart';
import 'package:great_form/great_form.dart';
import 'package:great_form/helpers/validator.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Great Form Filed Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(),
    );
  }
}

final List<GreatFormField> _fields = [
  const GreatFormField(
    hintText: 'Email',
    validator: Validator.password,
  ),
  const GreatFormField(
    hintText: 'Password',
    validator: Validator.password,
  ),
  GreatFormField(
    controller: TextEditingController(),
    hintText: 'phone number',
    validator: Validator.phone,
  ),
];

class MyHomePage extends StatelessWidget {
  const MyHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Column(
          children: [
            const Text(
              "Great Form",
              style: TextStyle(fontSize: 32),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Card(
                  color: Colors.amberAccent,
                  child: Column(
                    children: [
                      const Text(
                        "Regular Form",
                        style: TextStyle(fontSize: 24),
                      ),
                      const Divider(),
                      GreatForm(fields: _fields),
                    ],
                  )),
            ),
            const Text("Scrollable Form"),
            Expanded(
              child: ScrollableForm.horizontal(
                builder: (context, index) => _fields[index],
                childCount: _fields.length,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
