import 'package:flutter/material.dart';

class GreatText extends StatelessWidget {
  const GreatText(this.text, {super.key});
  final String? text;

  @override
  Widget build(BuildContext context) {
    return text != null ? Text(text!) : const SizedBox();
  }
}
