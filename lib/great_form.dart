library great_form;

import 'package:flutter/material.dart';
import 'package:great_form/helpers/great_form_field.dart';

class GreatForm extends StatefulWidget {
  const GreatForm({super.key, required this.fields, this.gap});
  final List<GreatFormField> fields;
  final double? gap;

  @override
  State<GreatForm> createState() => _GreatFormState();
}

class _GreatFormState extends State<GreatForm> {
  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Form(
        key: _formKey,
        child: ListView.separated(
          itemBuilder: (context, index) => widget.fields[index],
          separatorBuilder: (_, __) => SizedBox(width: widget.gap ?? 10, height: widget.gap ?? 10),
          itemCount: widget.fields.length,
          shrinkWrap: true,
        ));
  }
}
