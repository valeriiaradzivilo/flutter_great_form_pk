import 'package:flutter/material.dart';
import 'package:great_form/ui/helpers/form_button_type.dart';

/// Form button widget
class FormButton extends StatelessWidget {
  /// Constructor of the [FormButton]
  const FormButton({
    super.key,
    required this.text,
    required this.onPressed,
    required this.type,
  });

  /// Text of the button
  final String text;

  /// Action to be executed when the button is pressed
  final VoidCallback onPressed;

  /// Type of the button
  final FormButtonType type;

  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}
