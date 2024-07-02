import 'dart:convert';
import 'package:app_dictionary/app/core/fp/either.dart';
import 'package:app_dictionary/app/models/words_model.dart';
import 'package:app_dictionary/app/repositories/local/load_words_repository_impl.dart';
import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';

class MockAssetBundle extends Mock implements AssetBundle {}

void main() {
  late MockAssetBundle mockAssetBundle;
  late LoadWordsRepositoryImpl repository;

  setUp(() {
    mockAssetBundle = MockAssetBundle();
    repository = LoadWordsRepositoryImpl(assetBundle: mockAssetBundle);
  });
  group('LoadWordsRepositoryImpl', () {
    test('deve retornar WordsModel quando o JSON é carregado com sucesso',
        () async {
      const jsonString =
          '{"a": 1, "aa": 1, "aaa": 1, "aah": 1, "aahed": 1, "aahing": 1, "aahs": 1, "aal": 1}';

      when(() => mockAssetBundle.loadString('assets/words_dictionary.json'))
          .thenAnswer(() async => jsonString);

      final expectedModel = WordsModel.fromJson(jsonDecode(jsonString));
      final result = await repository.loadWords();

      expect(result, isA<Success>());
      expect(expectedModel, isNotEmpty);
    });
  });
}
