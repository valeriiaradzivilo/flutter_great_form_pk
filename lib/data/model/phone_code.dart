/// PhoneCode model class
class PhoneCode {
  /// Root phone code
  final String root;

  /// List of suffixes
  final List<String> suffixes;

  /// PhoneCode constructor
  PhoneCode({
    required this.root,
    required this.suffixes,
  });

  /// toJson method
  Map<String, dynamic> toJson() => {
        'root': root,
        'suffixes': suffixes,
      };

  /// fromJson method
  factory PhoneCode.fromJson(Map<String, dynamic> json) => PhoneCode(
        root: json['root'] as String,
        suffixes: (json['suffixes'] as List<dynamic>).cast<String>(),
      );
}
