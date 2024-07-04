import 'package:app_dictionary/app/core/exceptions/repository_exception.dart';
import 'package:app_dictionary/app/core/fp/either.dart';
import 'package:app_dictionary/app/core/rest_client/rest_client.dart';
import 'package:app_dictionary/app/core/rest_client/rest_client_response.dart';
import 'package:app_dictionary/app/models/word_model.dart';
import 'package:app_dictionary/app/repositories/remoto/word_repository_impl.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

class MockRestClient extends Mock implements RestClient {}

void main() {
  late WordRepositoryImpl repository;
  late MockRestClient mockRestClient;

  setUp(() {
    mockRestClient = MockRestClient();
    repository = WordRepositoryImpl(restClient: mockRestClient);
  });

  setUpAll(() {
    registerFallbackValue(Uri());
  });

  group('findByWord', () {
    const word = 'hello';
    const baseUrl = 'https://api.dictionaryapi.dev/api/v2/entries/en/';
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
                    'Used sarcastically to imply that the person addressed or referred to has done something the speaker ou writer considers to be foolish.',
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

    test('returns Success if the http call completes successfully', () async {
      when(() => mockRestClient.get(any())).thenAnswer(
        (_) async => RestClientResponse(data: responseJson),
      );

      final result = await repository.findByWord(word: word);

      expect(result, isA<Success<RepositoryException, WordModel>>());
      final success = result as Success<RepositoryException, WordModel>;
      expect(success.value.word, word);

      verify(() => mockRestClient.get('$baseUrl$word')).called(1);
    });

    test('returns Failure if the http call returns empty data', () async {
      when(() => mockRestClient.get(any())).thenAnswer(
        (_) async => RestClientResponse(data: []),
      );

      final result = await repository.findByWord(word: word);

      expect(result, isA<Failure<RepositoryException, WordModel>>());
      final failure = result as Failure<RepositoryException, WordModel>;
      expect(failure.exception.message, 'No data found');

      verify(() => mockRestClient.get('$baseUrl$word')).called(1);
    });

    test('returns Failure if an exception occurs', () async {
      when(() => mockRestClient.get(any()))
          .thenThrow(Exception('Failed to fetch data'));

      final result = await repository.findByWord(word: word);

      expect(result, isA<Failure<RepositoryException, WordModel>>());
      final failure = result as Failure<RepositoryException, WordModel>;
      expect(failure.exception.message, contains('Failed to fetch data'));

      verify(() => mockRestClient.get('$baseUrl$word')).called(1);
    });
  });
}
