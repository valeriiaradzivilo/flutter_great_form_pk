import 'package:flutter/material.dart';

enum Validator {
  notEmpty,
  email,
  password,
  passwordComplex,
  digitsOnly,
  phone,
  none;

  String? validate(String? text) => switch (this) {
        notEmpty => (text?.isEmpty ?? true) ? 'Do no forget to fill in this field' : null,
        email => _email(text),
        password => _password(text),
        passwordComplex => _passwordComplex(text),
        digitsOnly => _digitsOnly(text),
        phone => _digitsOnly(text),
        none => null,
      };

  TextInputType get keyboardType => switch (this) {
        phone => TextInputType.phone,
        digitsOnly => TextInputType.number,
        _ => TextInputType.text,
      };
}

String? _email(String? email) {
  final emailRegExp = RegExp(r'^[\w-]+(\.[\w-]+)*@[\w-]+(\.[\w-]+)+$');
  if (email == null || !emailRegExp.hasMatch(email)) {
    return 'Enter valid email';
  }
  return null;
}

String? _password(String? password) {
  final lowercaseRegExp = RegExp('[a-z]+.+');

  if (password == null) {
    return 'Fill in this field';
  } else if (password.isEmpty || password.length < 8) {
    return 'Password must contain at least 8 characters';
  } else if (!lowercaseRegExp.hasMatch(password)) {
    return 'Password must contain at least one lowercase letter';
  }

  return null;
}

String? _passwordComplex(String? password) {
  final uppercaseRegExp = RegExp('[A-Z]+.+');
  final lowercaseRegExp = RegExp('[a-z]+.+');
  final digitsRegExp = RegExp('\\d+');
  final charactersRegExp = RegExp('[@_!]+');
  final forbiddenCharactersRegExp = RegExp('[^!_@a-zA-Z\\d]');
  if (password == null) {
    return 'Fill in this field';
  } else if (password.isEmpty || password.length < 8) {
    return 'Password must contain at least 8 characters';
  } else if (!lowercaseRegExp.hasMatch(password)) {
    return 'Password must contain at least one lowercase letter';
  } else if (!uppercaseRegExp.hasMatch(password)) {
    return 'Password must contain at least one uppercase letter';
  } else if (!digitsRegExp.hasMatch(password)) {
    return 'Password must contain at least one digit';
  } else if (!charactersRegExp.hasMatch(password)) {
    return 'Password must contain at least one special character among @,!,_.';
  } else if (forbiddenCharactersRegExp.hasMatch(password)) {
    return 'Password contains forbidden character';
  }

  return null;
}

String? _digitsOnly(String? text) {
  final digitsRegExp = RegExp('\\d+');
  final digitsMissingRegExp = RegExp('[^\\d]');
  if (text == null || text.isEmpty) {
    return 'Fill in the field';
  } else if (!digitsRegExp.hasMatch(text)) {
    return 'This filed must contain digits';
  } else if (digitsMissingRegExp.hasMatch(text)) {
    return 'This field cannot use any symbols other than digits';
  }
  return null;
}
