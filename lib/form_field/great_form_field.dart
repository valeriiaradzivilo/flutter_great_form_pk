import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:great_form/form_field/phone/great_phone_form_field.dart';
import 'package:great_form/helpers/great_text.dart';
import 'package:great_form/helpers/validator.dart';

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

    return switch (validator) {
      Validator.phone => GreatPhoneFormField(controller: controller!),
      _ => Container(
          constraints: const BoxConstraints(maxWidth: 100),
          child: IntrinsicHeight(
            child: IntrinsicWidth(
              child: TextFormField(
                controller: controller,
                decoration: InputDecoration(label: GreatText(hintText)),
                autovalidateMode: validateOnInput ? AutovalidateMode.onUserInteraction : AutovalidateMode.disabled,
                inputFormatters: validator == Validator.digitsOnly ? [FilteringTextInputFormatter.digitsOnly] : null,
                validator: validator.validate,
                maxLines: expand ? null : 1,
                minLines: 1,
              ),
            ),
          ),
        )
    };
  }
}
