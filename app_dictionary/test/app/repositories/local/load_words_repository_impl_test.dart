import 'dart:convert';
import 'package:app_dictionary/app/core/fp/either.dart';
import 'package:app_dictionary/app/models/words_model.dart';
import 'package:app_dictionary/app/repositories/local/load_words_repository_impl.dart';
import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();
  late LoadWordsRepositoryImpl repository;

  setUp(() {
    repository = LoadWordsRepositoryImpl();
  });
  group('LoadWordsRepositoryImpl', () {
    test('Load JSON Dictionary', () async {
      const String testFilePath = 'assets/words_dictionary.json';

      final String content = await rootBundle.loadString(testFilePath);

      expect(content.isNotEmpty, true);
    });

    test('Load Words from JSON File', () async {
      const String testFilePath = 'assets/words_dictionary.json';
      final String content = await rootBundle.loadString(testFilePath);

      final expectedModel = WordsModel.fromJson(jsonDecode(content));
      final result = await repository.loadWords();

      expect(result, isA<Success>());
      expect(expectedModel, isA<WordsModel>());
    });
  });
}
