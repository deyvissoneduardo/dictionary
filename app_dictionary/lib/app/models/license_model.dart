import 'dart:convert';

class LicenseModel {
  String? name;
  String? url;

  LicenseModel({
    this.name,
    this.url,
  });

  Map<String, dynamic> toMap() {
    final result = <String, dynamic>{};

    if (name != null) {
      result.addAll({'name': name});
    }
    if (url != null) {
      result.addAll({'url': url});
    }

    return result;
  }

  factory LicenseModel.fromMap(Map<String, dynamic> map) {
    return LicenseModel(
      name: map['name'],
      url: map['url'],
    );
  }

  String toJson() => json.encode(toMap());

  factory LicenseModel.fromJson(String source) =>
      LicenseModel.fromMap(json.decode(source));
}
