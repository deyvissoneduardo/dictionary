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
    final responseJson = [
      {
        'word': 'hello',
        'phonetics': [
          {
            'audio':
                'https://api.dictionaryapi.dev/media/pronunciations/en/hello-au.mp3',
            'sourceUrl':
                'https://commons.wikimedia.org/w/index.php?curid=75797336',
            'license': {
              'name': 'BY-SA 4.0',
              'url': 'https://creativecommons.org/licenses/by-sa/4.0',
            },
          },
          {
            'text': '/həˈləʊ/',
            'audio':
                'https://api.dictionaryapi.dev/media/pronunciations/en/hello-uk.mp3',
            'sourceUrl':
                'https://commons.wikimedia.org/w/index.php?curid=9021983',
            'license': {
              'name': 'BY 3.0 US',
              'url': 'https://creativecommons.org/licenses/by/3.0/us',
            },
          },
          {'text': '/həˈloʊ/', 'audio': ''},
        ],
        'meanings': [
          {
            'partOfSpeech': 'noun',
            'definitions': [
              {
                'definition': '"Hello!" or an equivalent greeting.',
                'synonyms': [],
                'antonyms': [],
              }
            ],
            'synonyms': ['greeting'],
            'antonyms': [],
          },
          {
            'partOfSpeech': 'verb',
            'definitions': [
              {
                'definition': 'To greet with "hello".',
                'synonyms': [],
                'antonyms': [],
              }
            ],
            'synonyms': [],
            'antonyms': [],
          },
          {
            'partOfSpeech': 'interjection',
            'definitions': [
              {
                'definition':
                    'A greeting (salutation) said when meeting someone or acknowledging someone’s arrival or presence.',
                'synonyms': [],
                'antonyms': [],
                'example': 'Hello, everyone.',
              },
              {
                'definition': 'A greeting used when answering the telephone.',
                'synonyms': [],
                'antonyms': [],
                'example': 'Hello? How may I help you?',
              },
              {
                'definition':
                    'A call for response if it is not clear if anyone is present or listening, or if a telephone conversation may have been disconnected.',
                'synonyms': [],
                'antonyms': [],
                'example': 'Hello? Is anyone there?',
              },
              {
                'definition':
                    'Used sarcastically to imply that the person addressed or referred to has done something the speaker or writer considers to be foolish.',
                'synonyms': [],
                'antonyms': [],
                'example':
                    'You just tried to start your car with your cell phone. Hello?',
              },
              {
                'definition': 'An expression of puzzlement or discovery.',
                'synonyms': [],
                'antonyms': [],
                'example': 'Hello! What’s going on here?',
              }
            ],
            'synonyms': [],
            'antonyms': ['bye', 'goodbye'],
          }
        ],
        'license': {
          'name': 'CC BY-SA 3.0',
          'url': 'https://creativecommons.org/licenses/by-sa/3.0',
        },
        'sourceUrls': ['https://en.wiktionary.org/wiki/hello'],
      }
    ];
    test('Should return success of repository', () async {
      when(() => mockRepository.loadWords()).thenAnswer(
        (_) async => Success(WordsModel.fromJson(responseJson[0])),
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
