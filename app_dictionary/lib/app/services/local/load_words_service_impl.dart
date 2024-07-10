import '../../core/exceptions/service_exception.dart';
import '../../core/fp/either.dart';
import '../../repositories/local/load_words_repository.dart';
import 'load_words_service.dart';

class LoadWordsServiceImpl implements LoadWordsService {
  final LoadWordsRepository _repository;

  LoadWordsServiceImpl({required LoadWordsRepository repository})
      : _repository = repository;

  @override
  Future<Either<ServiceException, List<String>>> loadWords() async {
    final result = await _repository.loadWords();

    switch (result) {
      case Success(value: final words):
        final wordsList = words.getWordsList();
        return Success(wordsList);
      case Failure():
        return Failure(
          ServiceException('Failure when find words in repository'),
        );
    }
  }
}
