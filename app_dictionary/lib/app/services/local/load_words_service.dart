import '../../core/exceptions/service_exception.dart';
import '../../core/fp/either.dart';
import '../../models/words_model.dart';

abstract interface class LoadWordsService {
  Future<Either<ServiceException, WordsModel>> loadWords();
}
