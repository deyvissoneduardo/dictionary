import 'package:app_dictionary/app/models/words_model.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('WordsModel', () {
    test('getWordsList returns list of words from the map', () {
      final wordsMap = {'apple': 2, 'banana': 3, 'cherry': 5};
      final wordsModel = WordsModel(words: wordsMap);

      final List<String> wordsList = wordsModel.getWordsList();

      expect(wordsList, equals(['apple', 'banana', 'cherry']));
    });
  });
}
