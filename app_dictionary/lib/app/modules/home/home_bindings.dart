import 'package:flutter/services.dart' show AssetBundle, rootBundle;
import 'package:get/get.dart';
import '../../repositories/local/load_words_repository.dart';
import '../../repositories/local/load_words_repository_impl.dart';
import '../../repositories/remoto/word_repository.dart';
import '../../repositories/remoto/word_repository_impl.dart';
import '../../services/local/load_words_service.dart';
import '../../services/local/load_words_service_impl.dart';
import '../../services/remoto/word_service.dart';
import '../../services/remoto/word_service_impl.dart';
import './home_controller.dart';

class HomeBindings implements Bindings {
  @override
  void dependencies() {
    Get.put<AssetBundle>(rootBundle);

    Get.lazyPut<WordRepository>(
      () => WordRepositoryImpl(restClient: Get.find()),
    );

    Get.lazyPut<LoadWordsRepository>(
      () => LoadWordsRepositoryImpl(assetBundle: Get.find()),
    );

    Get.lazyPut<LoadWordsService>(
      () => LoadWordsServiceImpl(repository: Get.find()),
    );

    Get.lazyPut<WordService>(
      () => WordServiceImpl(repositoryImpl: Get.find()),
    );

    Get.put(
      HomeController(
        loadWordsService: Get.find(),
      ),
    );
  }
}
