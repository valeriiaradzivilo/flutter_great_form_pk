import 'dart:convert';

import 'package:great_form/model/country_name.dart';
import 'package:great_form/model/phone_code.dart';

class CountryCode {
  CountryCode({
    required this.name,
    required this.phoneCode,
    required this.flagLink,
  });

  final CountryName name;
  final PhoneCode phoneCode;
  final String? flagLink;

  // Create an instance from a Map
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

  static List<CountryCode> countryCodesFromJson(String str) =>
      List<CountryCode>.from(json.decode(str).map((x) => CountryCode.fromJson(x)).where((c) => c.phoneCode != "null"));
}
