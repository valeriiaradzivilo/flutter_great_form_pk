import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:great_form/helpers/great_text.dart';
import 'package:great_form/helpers/validator.dart';

class GreatFormField extends StatefulWidget {
  const GreatFormField(
      {super.key,
      this.controller,
      this.hintText,
      this.validateOnInput = true,
      this.validator = Validator.none,
      this.expand = false});
  final TextEditingController? controller;
  final String? hintText;
  final bool validateOnInput;
  final Validator validator;
  final bool expand;

  @override
  State<GreatFormField> createState() => _GreatFormFieldState();
}

class _GreatFormFieldState extends State<GreatFormField> {
  @override
  void dispose() {
    widget.controller?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: widget.controller ?? TextEditingController(),
      decoration: InputDecoration(label: GreatText(widget.hintText)),
      autovalidateMode: widget.validateOnInput ? AutovalidateMode.onUserInteraction : AutovalidateMode.disabled,
      inputFormatters: widget.validator != Validator.digitsOnly ? [FilteringTextInputFormatter.digitsOnly] : null,
      validator: widget.validator.validate,
      maxLines: widget.expand ? null : 1,
      minLines: 1,
    );
  }
}
