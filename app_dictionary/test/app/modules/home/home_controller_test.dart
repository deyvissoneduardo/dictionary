import 'package:app_dictionary/app/core/exceptions/service_exception.dart';
import 'package:app_dictionary/app/core/fp/either.dart';
import 'package:app_dictionary/app/modules/home/home_controller.dart';
import 'package:app_dictionary/app/services/local/load_words_service.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

class MockLoadWordsService extends Mock implements LoadWordsService {}

void main() {
  late HomeController homeController;
  late MockLoadWordsService mockLoadWordsService;

  setUp(() {
    mockLoadWordsService = MockLoadWordsService();
    homeController = HomeController(loadWordsService: mockLoadWordsService);
  });

  group('HomeController', () {
    test('should load words successfully', () async {
      final words = ['apple', 'banana', 'cherry'];
      when(() => mockLoadWordsService.loadWords())
          .thenAnswer((_) async => Success(words));

      homeController.onInit();
      await Future.delayed(const Duration(seconds: 4));

      expect(homeController.isLoading.value, false);
      expect(homeController.wordsModel, words);
      expect(homeController.erroMessage.value, '');
    });

    test('should handle load words failure', () async {
      const errorMessage = 'Failed to load words';
      when(() => mockLoadWordsService.loadWords())
          .thenAnswer((_) async => Failure(ServiceException(errorMessage)));

      homeController.onInit();
      await Future.delayed(const Duration(seconds: 4));

      expect(homeController.isLoading.value, false);
      expect(homeController.wordsModel.isEmpty, true);
      expect(homeController.erroMessage.value, errorMessage);
    });

    test('should add word to favorites', () {
      homeController.wordsModel.addAll(['apple', 'banana', 'cherry']);

      homeController.favoriteWord(0);

      expect(homeController.wordsFavorite, ['apple']);
    });

    test('should remove word from favorites if already present', () {
      homeController.wordsModel.addAll(['apple', 'banana', 'cherry']);
      homeController.wordsFavorite.add('apple');

      homeController.favoriteWord(0);

      expect(homeController.wordsFavorite.isEmpty, true);
    });
  });
}
