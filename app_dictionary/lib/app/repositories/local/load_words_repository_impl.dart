import 'dart:convert';

import 'package:flutter/services.dart';

import '../../core/exceptions/repository_exception.dart';
import '../../core/fp/either.dart';
import '../../models/words_model.dart';
import 'load_words_repository.dart';

class LoadWordsRepositoryImpl implements LoadWordsRepository {
  final AssetBundle assetBundle;

  LoadWordsRepositoryImpl({required this.assetBundle});

  @override
  Future<Either<RepositoryException, WordsModel>> loadWords() async {
    try {
      final String words =
          await assetBundle.loadString('assets/words_dictionary.json');

      final Map<String, dynamic> jsonMap = jsonDecode(words);
      final WordsModel content = WordsModel.fromJson(jsonMap);

      return Success(content);
    } on RepositoryException catch (e) {
      throw Failure(
        RepositoryException(message: e.message, code: e.code),
      );
    }
  }
}
