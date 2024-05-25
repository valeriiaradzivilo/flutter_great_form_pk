import 'package:flutter/material.dart';
import 'package:great_form/great_form.dart';
import 'package:great_form/ui/additional_forms/card_form.dart';
import 'package:great_form/ui/additional_forms/scrollable_form.dart';
import 'package:great_form/ui/form_field/great_form_field.dart';
import 'package:great_form/ui/helpers/validator.dart';

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
    hintText: 'Phone Number',
    validator: Validator.phone,
  ),
];

class MyHomePage extends StatelessWidget {
  const MyHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Great Form Example'),
          backgroundColor: Colors.cyan,
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: [
                const SizedBox(height: 10),
                CardForm(
                  title: "Card Form",
                  backgroundColor: Colors.amberAccent,
                  form: GreatForm(fields: _fields),
                ),
                CardForm(
                  title: "Scrollable Form",
                  backgroundColor: Colors.blueAccent,
                  form: ScrollableForm.horizontal(
                    builder: (context, index) => _fields[index],
                    childCount: _fields.length,
                    constraints: const BoxConstraints(maxHeight: 100),
                  ),
                  isExpandedForm: false,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
