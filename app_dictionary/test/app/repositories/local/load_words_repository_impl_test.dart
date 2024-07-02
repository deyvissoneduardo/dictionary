import 'dart:convert';
import 'package:app_dictionary/app/core/exceptions/repository_exception.dart';
import 'package:app_dictionary/app/core/fp/either.dart';
import 'package:app_dictionary/app/models/words_model.dart';
import 'package:app_dictionary/app/repositories/local/load_words_repository_impl.dart';
import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

class MockAssetBundle extends Mock implements AssetBundle {}

void main() {
  late MockAssetBundle mockAssetBundle;
  late LoadWordsRepositoryImpl repository;

  setUp(() {
    TestWidgetsFlutterBinding.ensureInitialized();
    mockAssetBundle = MockAssetBundle();
    repository = LoadWordsRepositoryImpl(assetBundle: mockAssetBundle);
  });
  group('Group test LoadWordsRepositoryImpl', () {
    test('Load JSON Dictionary', () async {
      const String testFilePath = 'assets/words_dictionary.json';

      final String content = await rootBundle.loadString(testFilePath);

      expect(content.isNotEmpty, true);
    });

    test('Load Words from JSON File Success', () async {
      const jsonString =
          '{"a": 1, "aa": 1, "aaa": 1, "aah": 1, "aahed": 1, "aahing": 1, "aahs": 1, "aal": 1}';

      when(() => mockAssetBundle.loadString('assets/words_dictionary.json'))
          .thenAnswer((_) async => jsonString);

      final expectedModel = WordsModel.fromJson(jsonDecode(jsonString));
      final result = await repository.loadWords();

      expect(result, isA<Success>());
      expect(expectedModel, isA<WordsModel>());
    });

    test('Load Words from JSON File Failure', () async {
      when(() => mockAssetBundle.loadString('assets/words_dictionary.json'))
          .thenThrow(
        Failure(RepositoryException(message: 'Failure get words')),
      );

      final call = repository.loadWords;

      expect(() => call(), throwsA(isA<Failure>()));
    });
  });
}
