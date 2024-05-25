import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:great_form/ui/form_field/phone/great_phone_form_field.dart';
import 'package:great_form/ui/helpers/great_text.dart';
import 'package:great_form/ui/helpers/validator.dart';
// TODO: Make a required field
// TODO: Make a card form with certain amount of pages

class GreatFormField extends StatelessWidget {
  const GreatFormField({
    super.key,
    this.controller,
    this.hintText,
    this.validateOnInput = true,
    this.validator = Validator.none,
    this.expand = false,
  });

  /// Controller to get values from later
  final TextEditingController? controller;

  /// Text that will take place until the input
  final String? hintText;

  /// Validate on user input or never
  final bool validateOnInput;

  /// Type of predefined validator
  final Validator validator;

  /// Expand on input
  final bool expand;

  @override
  Widget build(BuildContext context) {
    if (validator == Validator.phone) {
      assert(controller != null);
    }

    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: ConstrainedBox(
        constraints: BoxConstraints(minWidth: (hintText?.length ?? 1) * 10),
        child: IntrinsicHeight(
          child: IntrinsicWidth(
              child: switch (validator) {
            Validator.phone => GreatPhoneFormField(
                  formField: _FormField(
                controller: controller,
                hintText: hintText,
                validateOnInput: validateOnInput,
                validator: validator,
                expand: expand,
              )),
            _ => _FormField(
                controller: controller,
                hintText: hintText,
                validateOnInput: validateOnInput,
                validator: validator,
                expand: expand,
              )
          }),
        ),
      ),
    );
  }
}

class _FormField extends StatelessWidget {
  const _FormField({
    required this.controller,
    required this.hintText,
    required this.validateOnInput,
    required this.validator,
    required this.expand,
  });

  /// Controller to get values from later
  final TextEditingController? controller;

  /// Text that will take place until the input
  final String? hintText;

  /// Validate on user input or never
  final bool validateOnInput;

  /// Type of predefined validator
  final Validator validator;

  /// Expand on input
  final bool expand;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      decoration: InputDecoration(label: GreatText(hintText)),
      autovalidateMode: validateOnInput ? AutovalidateMode.onUserInteraction : AutovalidateMode.disabled,
      inputFormatters: validator == Validator.digitsOnly ? [FilteringTextInputFormatter.digitsOnly] : null,
      validator: validator.validate,
      maxLines: expand ? null : 1,
      minLines: 1,
      keyboardType: validator.keyboardType,
    );
  }
}