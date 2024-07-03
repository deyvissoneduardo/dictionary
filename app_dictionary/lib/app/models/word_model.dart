import 'dart:convert';

import 'license_model.dart';
import 'meanings_model.dart';
import 'phonetics_model.dart';

class WordModel {
  String? word;
  List<PhoneticsModel>? phonetics;
  List<MeaningsModel>? meanings;
  LicenseModel? license;
  List<String>? sourceUrls;

  WordModel({
    this.word,
    this.phonetics,
    this.meanings,
    this.license,
    this.sourceUrls,
  });

  Map<String, dynamic> toMap() {
    final result = <String, dynamic>{};

    if (word != null) {
      result.addAll({'word': word});
    }
    if (phonetics != null) {
      result.addAll({'phonetics': phonetics!.map((x) => x.toMap()).toList()});
    }
    if (meanings != null) {
      result.addAll({'meanings': meanings!.map((x) => x.toMap()).toList()});
    }
    if (license != null) {
      result.addAll({'license': license!.toMap()});
    }
    if (sourceUrls != null) {
      result.addAll({'sourceUrls': sourceUrls});
    }

    return result;
  }

  factory WordModel.fromMap(Map<String, dynamic> map) {
    return WordModel(
      word: map['word'],
      phonetics: map['phonetics'] != null
          ? List<PhoneticsModel>.from(
              map['phonetics']?.map((x) => PhoneticsModel.fromMap(x)),
            )
          : null,
      meanings: map['meanings'] != null
          ? List<MeaningsModel>.from(
              map['meanings']?.map((x) => MeaningsModel.fromMap(x)),
            )
          : null,
      license:
          map['license'] != null ? LicenseModel.fromMap(map['license']) : null,
      sourceUrls: List<String>.from(map['sourceUrls']),
    );
  }

  String toJson() => json.encode(toMap());

  factory WordModel.fromJson(String source) =>
      WordModel.fromMap(json.decode(source));
}
