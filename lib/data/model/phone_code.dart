class PhoneCode {
  final String root;
  final List<String> suffixes;

  PhoneCode({
    required this.root,
    required this.suffixes,
  });

  Map<String, dynamic> toJson() => {
        'root': root,
        'suffixes': suffixes,
      };

  factory PhoneCode.fromJson(Map<String, dynamic> json) => PhoneCode(
        root: json['root'] as String,
        suffixes: (json['suffixes'] as List<dynamic>).cast<String>(),
      );
}
