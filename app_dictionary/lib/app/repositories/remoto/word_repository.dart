import '../../core/exceptions/repository_exception.dart';
import '../../core/fp/either.dart';
import '../../models/word_model.dart';

abstract interface class WordRepository {
  Future<Either<RepositoryException, WordModel>> findByWord({
    required String word,
  });
}
