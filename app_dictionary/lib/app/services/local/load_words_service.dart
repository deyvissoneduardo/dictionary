import '../../core/exceptions/service_exception.dart';
import '../../core/fp/either.dart';

abstract interface class LoadWordsService {
  Future<Either<ServiceException, List<String>>> loadWords();
}
