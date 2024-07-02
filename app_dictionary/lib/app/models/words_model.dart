class WordsModel {
  final Map<String, int> words;

  WordsModel({required this.words});

  factory WordsModel.fromJson(Map<String, dynamic> json) {
    return WordsModel(
      words: Map<String, int>.from(json),
    );
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is WordsModel && other.words == words;
  }

  @override
  int get hashCode => words.hashCode;

  @override
  String toString() => 'WordsModel(words: $words)';
}
