library great_form;

import 'package:flutter/material.dart';

class GreatForm extends StatefulWidget {
  const GreatForm({super.key, required this.fieldCount});
  final int fieldCount;

  @override
  State<GreatForm> createState() => _GreatFormState();
}

class _GreatFormState extends State<GreatForm> {
  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Form(
        key: _formKey,
        child: Column(
          children: [for (int i = 0; i < widget.fieldCount; i++) TextFormField()],
        ));
  }
}
