import '../../core/exceptions/service_exception.dart';
import '../../core/fp/either.dart';
import '../../models/word_model.dart';

abstract interface class WordService {
  Future<Either<ServiceException, WordModel>> findByWord({
    required String word,
  });
}
