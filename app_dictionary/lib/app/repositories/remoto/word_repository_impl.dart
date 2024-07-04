import '../../core/exceptions/repository_exception.dart';
import '../../core/fp/either.dart';
import '../../core/rest_client/rest_client.dart';
import '../../models/word_model.dart';
import './word_repository.dart';

class WordRepositoryImpl implements WordRepository {
  final RestClient _restClient;

  WordRepositoryImpl({required RestClient restClient})
      : _restClient = restClient;

  @override
  Future<Either<RepositoryException, WordModel>> findByWord({
    required String word,
  }) async {
    try {
      final response = await _restClient.get(
        'https://api.dictionaryapi.dev/api/v2/entries/en/$word',
      );

      if (response.data is List && response.data.isNotEmpty) {
        final wordModel = WordModel.fromMap(response.data[0]);
        return Success(wordModel);
      } else {
        return Failure(RepositoryException(message: 'No data found'));
      }
    } on RepositoryException catch (e) {
      return Failure(RepositoryException(message: e.message, code: e.code));
    } catch (e) {
      return Failure(RepositoryException(message: e.toString()));
    }
  }
}
