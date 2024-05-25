import 'package:flutter/material.dart';
import 'package:great_form/great_form.dart';

/// [CardForm] is a widget that displays a card with a title and a form.
/// The form can be expanded or not.
/// The card has a background color and a padding.
/// The title is displayed with a font size of 32.
/// The card has a divider below the title.
/// The form is displayed below the divider.
class CardForm extends StatelessWidget {
  /// Constructor of the [CardForm]
  const CardForm({
    super.key,
    required this.title,
    required this.backgroundColor,
    required this.form,
    this.isExpandedForm = false,
    this.padding,
  });

  /// Title of the card
  final String title;

  /// Background color of the card
  final Color backgroundColor;

  /// Form to be displayed
  final GreatForm form;

  /// If the form should be expanded
  final bool isExpandedForm;

  /// Padding of the card content
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
