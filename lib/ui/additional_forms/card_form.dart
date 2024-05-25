import 'package:flutter/material.dart';
import 'package:great_form/great_form.dart';

class CardForm extends StatelessWidget {
  const CardForm({
    super.key,
    required this.title,
    required this.backgroundColor,
    required this.form,
    this.isExpandedForm = false,
    this.padding,
  });
  final String title;
  final Color backgroundColor;
  final GreatForm form;
  final bool isExpandedForm;
  final EdgeInsetsGeometry? padding;

  @override
  Widget build(BuildContext context) {
    return Card(
      color: backgroundColor,
      child: Padding(
        padding: padding ?? const EdgeInsets.all(8.0),
        child: Column(
          children: [
            Text(
              title,
              style: const TextStyle(fontSize: 32),
            ),
            Divider(
              color: backgroundColor.withAlpha(10),
            ),
            if (isExpandedForm) Flexible(child: form) else form,
          ],
        ),
      ),
    );
  }
}
