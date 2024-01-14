import 'package:flutter/material.dart';
import 'package:great_form/additional_forms/scrollable_form.dart';
import 'package:great_form/great_form.dart';
import 'package:great_form/helpers/great_form_field.dart';
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
      title: 'Flutter Demo',
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
];

class MyHomePage extends StatelessWidget {
  const MyHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            GreatForm(fields: _fields),
            Expanded(
                child: ScrollableForm.horizontal(
                    builder: (context, index) => _fields[index],
                    childCount: _fields.length)),
          ],
        ),
      ),
    );
  }
}
