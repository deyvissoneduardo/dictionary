import 'dart:convert';

import 'definitions_model.dart';

class MeaningsModel {
  String? partOfSpeech;
  List<DefinitionsModel>? definitions;
  List<String>? synonyms;
  List<String>? antonyms;

  MeaningsModel({
    this.partOfSpeech,
    this.definitions,
    this.synonyms,
    this.antonyms,
  });

  Map<String, dynamic> toMap() {
    final result = <String, dynamic>{};

    if (partOfSpeech != null) {
      result.addAll({'partOfSpeech': partOfSpeech});
    }
    if (definitions != null) {
      result
          .addAll({'definitions': definitions!.map((x) => x.toMap()).toList()});
    }
    if (synonyms != null) {
      result.addAll({'synonyms': synonyms});
    }
    if (antonyms != null) {
      result.addAll({'antonyms': antonyms});
    }

    return result;
  }

  factory MeaningsModel.fromMap(Map<String, dynamic> map) {
    return MeaningsModel(
      partOfSpeech: map['partOfSpeech'],
      definitions: map['definitions'] != null
          ? List<DefinitionsModel>.from(
              map['definitions']?.map((x) => DefinitionsModel.fromMap(x)),
            )
          : null,
      synonyms: List<String>.from(map['synonyms']),
      antonyms: List<String>.from(map['antonyms']),
    );
  }

  String toJson() => json.encode(toMap());

  factory MeaningsModel.fromJson(String source) =>
      MeaningsModel.fromMap(json.decode(source));
}
