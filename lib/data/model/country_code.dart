import 'dart:convert';

import 'package:great_form/data/model/country_name.dart';
import 'package:great_form/data/model/phone_code.dart';

/// Country code model
class CountryCode {
  /// Constructor
  CountryCode({
    required this.name,
    required this.phoneCode,
    required this.flagLink,
  });

  /// Country name model
  final CountryName name;

  /// Phone code model
  final PhoneCode phoneCode;

  /// Flag link
  final String? flagLink;

  /// Create an instance from a Map
  factory CountryCode.fromJson(Map<String, dynamic> json) {
    return CountryCode(
      name: CountryName.fromJson(json['name']),
      phoneCode: PhoneCode.fromJson(json['idd']),
      flagLink: _flagUrl(json),
    );
  }

  static String? _flagUrl(Map<String, dynamic> json) {
    if (json['flags'] == null) return null;
    if (json['flags']['png'] == null) return null;
    if (Uri.tryParse(json['flags']['png']) != null) return json['flags']['png'];

    return null;
  }

  /// Create a list of country codes from a JSON string
  static List<CountryCode> countryCodesFromJson(String str) =>
      List<CountryCode>.from(json.decode(str).map((x) => CountryCode.fromJson(x)).where((c) => c.phoneCode != "null"));
}
