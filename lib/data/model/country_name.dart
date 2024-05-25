/// CountryName model class
class CountryName {
  ///Common country name
  final String common;

  ///Official country name
  final String official;

  /// CountryName constructor
  CountryName({
    required this.common,
    required this.official,
  });

  /// Instance to a Map
  Map<String, dynamic> toJson() => {
        'common': common,
        'official': official,
      };

  /// Create an instance from a Map
  factory CountryName.fromJson(Map<String, dynamic> json) => CountryName(
        common: json['common'] as String,
        official: json['official'] as String,
      );
}
