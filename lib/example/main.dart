import 'package:flutter/material.dart';
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
      title: 'Great Form Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  const MyHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: GreatForm(fields: [
            GreatFormField(
              hintText: 'Email',
              validator: Validator.password,
            ),
            GreatFormField(
              hintText: 'Password',
              validator: Validator.password,
            ),
          ]),
        ),
      ),
    );
  }
}
