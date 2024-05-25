import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:great_form/ui/form_field/phone/great_phone_form_field.dart';
import 'package:great_form/ui/helpers/great_text.dart';
import 'package:great_form/ui/helpers/validator.dart';
// TODO: Make a required field in a form
// TODO: Make a card form with certain amount of pages

/// [GreatFormField] is a form field with a predefined validator
/// [controller] is the controller to get values from later
///   [hintText] is the text that will take place until the input
///  [validateOnInput] is the validation on user input or never
/// [validator] is the type of predefined validator
/// [expand] is the expand on input
class GreatFormField extends StatelessWidget {
  /// [GreatFormField] constructor
  const GreatFormField({
    super.key,
    this.controller,
    this.hintText,
    this.validateOnInput = true,
    this.validator = Validator.none,
    this.expand = false,
    this.constraints,
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

  /// [constraints] is the constraints of the form field
  final BoxConstraints? constraints;

  @override
  Widget build(BuildContext context) {
    if (validator == Validator.phone) {
      assert(controller != null);
    }

    final customConstraints = constraints ?? BoxConstraints(minWidth: (hintText?.length ?? 1) * 20);
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: ConstrainedBox(
        constraints: customConstraints,
        child: IntrinsicHeight(
          child: IntrinsicWidth(
              child: switch (validator) {
            Validator.phone => GreatPhoneFormField(
                formField: _FormField(
                  controller: controller,
                  hintText: hintText,
                  validateOnInput: validateOnInput,
                  validator: validator,
                  expandFieldOnInput: expand,
                ),
                constraints: customConstraints,
              ),
            _ => _FormField(
                controller: controller,
                hintText: hintText,
                validateOnInput: validateOnInput,
                validator: validator,
                expandFieldOnInput: expand,
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
    required this.expandFieldOnInput,
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
  final bool expandFieldOnInput;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      decoration: InputDecoration(label: GreatText(hintText)),
      autovalidateMode: validateOnInput ? AutovalidateMode.onUserInteraction : AutovalidateMode.disabled,
      inputFormatters: validator == Validator.digitsOnly ? [FilteringTextInputFormatter.digitsOnly] : null,
      validator: validator.validate,
      maxLines: expandFieldOnInput ? null : 1,
      minLines: 1,
      keyboardType: validator.keyboardType,
    );
  }
}
