import 'package:app_dictionary/app/core/exceptions/service_exception.dart';
import 'package:app_dictionary/app/core/fp/either.dart';
import 'package:app_dictionary/app/models/words_model.dart';
import 'package:app_dictionary/app/repositories/local/load_words_repository_impl.dart';
import 'package:app_dictionary/app/services/local/load_words_service_impl.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

class MockLoadWordsRepositoryImpl extends Mock
    implements LoadWordsRepositoryImpl {}

class MockWordsModel extends Mock implements WordsModel {}

void main() {
  late LoadWordsServiceImpl service;
  late MockLoadWordsRepositoryImpl mockRepository;

  setUp(() {
    TestWidgetsFlutterBinding.ensureInitialized();
    mockRepository = MockLoadWordsRepositoryImpl();
    service = LoadWordsServiceImpl(repository: mockRepository);
  });
  group('Group test LoadWordsServiceImpl', () {
    test('Should return success of repository', () async {
      when(() => mockRepository.loadWords()).thenAnswer(
        (_) async => Success(MockWordsModel()),
      );

      final result = await service.loadWords();

      expect(result, isA<Success>());
    });

    test('Should return failure of repository', () async {
      when(() => mockRepository.loadWords())
          .thenThrow(Failure(ServiceException('Failure get words')));

      final call = service.loadWords;

      expect(() => call(), throwsA(isA<Failure>()));
    });
  });
}
