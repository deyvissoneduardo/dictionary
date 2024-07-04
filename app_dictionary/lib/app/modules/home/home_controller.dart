import 'dart:developer';

import 'package:get/get.dart';

import '../../core/fp/either.dart';
import '../../repositories/remoto/word_repository_impl.dart';

class HomeController extends GetxController {
  final WordRepositoryImpl repositoryImpl;

  HomeController({required this.repositoryImpl});

  @override
  void onInit() {
    loadWord('hello');
    super.onInit();
  }

  void loadWord(String word) async {
    final result = await repositoryImpl.findByWord(word: word);
    switch (result) {
      case Success(value: final word):
        log(word.toJson());
      case Failure(exception: final err):
        log('$err');
    }
  }
}
