import 'package:app_dictionary/app/core/exceptions/repository_exception.dart';
import 'package:app_dictionary/app/core/exceptions/service_exception.dart';
import 'package:app_dictionary/app/core/fp/either.dart';
import 'package:app_dictionary/app/models/word_model.dart';
import 'package:app_dictionary/app/repositories/remoto/word_repository_impl.dart';
import 'package:app_dictionary/app/services/remoto/word_service_impl.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

class MockWordRepositoryImpl extends Mock implements WordRepositoryImpl {}

void main() {
  late WordServiceImpl wordService;
  late MockWordRepositoryImpl mockWordRepository;

  setUp(() {
    mockWordRepository = MockWordRepositoryImpl();
    wordService = WordServiceImpl(repositoryImpl: mockWordRepository);
  });

  group('WordServiceImpl', () {
    const word = 'hello';
    final wordModel = WordModel(
      word: 'hello',
      phonetics: [],
      meanings: [],
    );

    test('returns Success if repository returns Success', () async {
      when(() => mockWordRepository.findByWord(word: word))
          .thenAnswer((_) async => Success(wordModel));

      final result = await wordService.findByWord(word: word);

      expect(result, isA<Success<ServiceException, WordModel>>());
      final success = result as Success<ServiceException, WordModel>;
      expect(success.value, wordModel);

      verify(() => mockWordRepository.findByWord(word: word)).called(1);
    });

    test('returns Failure if repository returns Failure', () async {
      const errorMessage = 'Repository error';

      when(() => mockWordRepository.findByWord(word: word)).thenAnswer(
        (_) async => Failure(RepositoryException(message: errorMessage)),
      );

      final result = await wordService.findByWord(word: word);

      expect(result, isA<Failure<ServiceException, WordModel>>());
      final failure = result as Failure<ServiceException, WordModel>;
      expect(failure.exception.message, errorMessage);

      verify(() => mockWordRepository.findByWord(word: word)).called(1);
    });
  });
}
