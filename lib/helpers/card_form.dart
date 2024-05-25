import 'package:flutter/material.dart';
import 'package:great_form/great_form.dart';

class CardForm extends StatelessWidget {
  const CardForm({
    super.key,
    required this.title,
    required this.backgroundColor,
    required this.form,
  });
  final String title;
  final Color backgroundColor;
  final GreatForm form;

  @override
  Widget build(BuildContext context) {
    return Card(
      color: backgroundColor,
      child: Column(
        children: [
          Text(
            title,
            style: const TextStyle(fontSize: 32),
          ),
          Divider(
            color: backgroundColor.withAlpha(100),
          ),
          Expanded(child: form),
        ],
      ),
    );
  }
}
