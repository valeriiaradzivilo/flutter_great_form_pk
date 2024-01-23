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
      flagLink: json['flags']?['png'] as String?,
    );
  }

  static List<CountryCode> countryCodesFromJson(String str) =>
      List<CountryCode>.from(json.decode(str).map((x) => CountryCode.fromJson(x)).where((c) => c.phoneCode != "null"));
}
