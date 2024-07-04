import '../../core/exceptions/service_exception.dart';
import '../../core/fp/either.dart';
import '../../models/word_model.dart';
import '../../repositories/remoto/word_repository_impl.dart';
import './word_service.dart';

class WordServiceImpl implements WordService {
  final WordRepositoryImpl _repositoryImpl;

  WordServiceImpl({required WordRepositoryImpl repositoryImpl})
      : _repositoryImpl = repositoryImpl;
  @override
  Future<Either<ServiceException, WordModel>> findByWord({
    required String word,
  }) async {
    final result = await _repositoryImpl.findByWord(word: word);

    switch (result) {
      case Success(value: final word):
        return Success(word);
      case Failure(exception: final error):
        return Failure(ServiceException(error.message!));
    }
  }
}
