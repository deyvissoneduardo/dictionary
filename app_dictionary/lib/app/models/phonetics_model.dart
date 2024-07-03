import 'dart:convert';

import 'license_model.dart';

class PhoneticsModel {
  String? audio;
  String? sourceUrl;
  LicenseModel? license;
  String? text;

  PhoneticsModel({
    this.audio,
    this.sourceUrl,
    this.license,
    this.text,
  });

  Map<String, dynamic> toMap() {
    final result = <String, dynamic>{};

    if (audio != null) {
      result.addAll({'audio': audio});
    }
    if (sourceUrl != null) {
      result.addAll({'sourceUrl': sourceUrl});
    }
    if (license != null) {
      result.addAll({'license': license!.toMap()});
    }
    if (text != null) {
      result.addAll({'text': text});
    }

    return result;
  }

  factory PhoneticsModel.fromMap(Map<String, dynamic> map) {
    return PhoneticsModel(
      audio: map['audio'],
      sourceUrl: map['sourceUrl'],
      license:
          map['license'] != null ? LicenseModel.fromMap(map['license']) : null,
      text: map['text'],
    );
  }

  String toJson() => json.encode(toMap());

  factory PhoneticsModel.fromJson(String source) =>
      PhoneticsModel.fromMap(json.decode(source));
}
