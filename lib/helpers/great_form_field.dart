import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:great_form/helpers/great_text.dart';
import 'package:great_form/helpers/validator.dart';

class GreatFormField extends StatelessWidget {
  const GreatFormField({
    super.key,
    this.controller,
    this.hintText,
    this.validateOnInput = true,
    this.validatorType = Validator.none,
    this.expand = false,
  });

  final TextEditingController? controller;
  final String? hintText;
  final bool validateOnInput;
  final Validator validatorType;
  final bool expand;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      decoration: InputDecoration(label: GreatText(hintText)),
      autovalidateMode: validateOnInput ? AutovalidateMode.onUserInteraction : AutovalidateMode.disabled,
      inputFormatters: validatorType == Validator.digitsOnly ? [FilteringTextInputFormatter.digitsOnly] : null,
      validator: validatorType.validate,
      maxLines: expand ? null : 1,
      minLines: 1,
    );
  }
}
