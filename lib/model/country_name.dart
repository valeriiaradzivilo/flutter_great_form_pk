class CountryName {
  final String common;
  final String official;

  CountryName({
    required this.common,
    required this.official,
  });

  Map<String, dynamic> toJson() => {
        'common': common,
        'official': official,
      };

  factory CountryName.fromJson(Map<String, dynamic> json) => CountryName(
        common: json['common'] as String,
        official: json['official'] as String,
      );
}
