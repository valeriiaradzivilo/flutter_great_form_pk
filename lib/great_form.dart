library great_form;

import 'package:flutter/material.dart';
import 'package:great_form/ui/form_field/great_form_field.dart';

/// [GreatForm] is a shortened version of a basic form with modifiable [gap] and [fields]
/// Predefined [gap] is 10
class GreatForm extends StatefulWidget {
  /// [fields] is the list of fields in a form
  /// [gap] is the space between the fields
  const GreatForm({super.key, required this.fields, this.gap = 10});

  /// Input fields
  final List<GreatFormField> fields;

  /// Distance between fields
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
          separatorBuilder: (_, __) => SizedBox(width: widget.gap, height: widget.gap),
          itemCount: widget.fields.length,
          shrinkWrap: true,
        ));
  }
}
