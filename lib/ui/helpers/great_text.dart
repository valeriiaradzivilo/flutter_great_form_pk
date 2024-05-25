import 'package:flutter/material.dart';

/// [GreatText] is a [Text] but with the ability to be null
class GreatText extends StatelessWidget {
  /// [GreatText] constructor
  const GreatText(this.text, {super.key});

  /// [text] is the text to be displayed
  final String? text;

  @override
  Widget build(BuildContext context) {
    return text != null ? Text(text!) : const SizedBox();
  }
}
