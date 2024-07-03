import 'dart:convert';

class DefinitionsModel {
  String? definition;
  List<dynamic>? synonyms;
  List<dynamic>? antonyms;
  String? example;

  DefinitionsModel({
    this.definition,
    this.synonyms,
    this.antonyms,
    this.example,
  });

  Map<String, dynamic> toMap() {
    final result = <String, dynamic>{};

    if (definition != null) {
      result.addAll({'definition': definition});
    }
    if (synonyms != null) {
      result.addAll({'synonyms': synonyms});
    }
    if (antonyms != null) {
      result.addAll({'antonyms': antonyms});
    }
    if (example != null) {
      result.addAll({'example': example});
    }

    return result;
  }

  factory DefinitionsModel.fromMap(Map<String, dynamic> map) {
    return DefinitionsModel(
      definition: map['definition'],
      synonyms: List<dynamic>.from(map['synonyms']),
      antonyms: List<dynamic>.from(map['antonyms']),
      example: map['example'],
    );
  }

  String toJson() => json.encode(toMap());

  factory DefinitionsModel.fromJson(String source) =>
      DefinitionsModel.fromMap(json.decode(source));
}
