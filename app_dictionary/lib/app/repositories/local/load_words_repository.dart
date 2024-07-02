import '../../core/exceptions/repository_exception.dart';
import '../../core/fp/either.dart';
import '../../models/words_model.dart';

abstract class LoadWordsRepository {
  Future<Either<RepositoryException, WordsModel>> loadWords();
}
