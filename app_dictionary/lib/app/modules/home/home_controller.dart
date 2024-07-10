import 'package:get/get.dart';

import '../../core/fp/either.dart';
import '../../services/local/load_words_service.dart';

class HomeController extends GetxController {
  final LoadWordsService _loadWordsService;
  late RxList<String> wordsModel = <String>[].obs;
  late RxList<String> wordsFavorite = <String>[].obs;
  RxString erroMessage = ''.obs;
  RxBool isLoading = false.obs;

  HomeController({
    required LoadWordsService loadWordsService,
  }) : _loadWordsService = loadWordsService;

  @override
  void onInit() {
    _loadWordsLocal();
    super.onInit();
  }

  void _loadWordsLocal() async {
    isLoading.value = true;
    final result = await _loadWordsService.loadWords();
    await Future.delayed(const Duration(seconds: 3));
    switch (result) {
      case Success(value: final words):
        isLoading.value = false;
        wordsModel.addAll(words);
      case Failure(exception: final err):
        erroMessage.value = err.message;
        isLoading.value = false;
    }
  }

  void favoriteWord(int index) {
    if (!wordsFavorite.contains(wordsModel[index])) {
      wordsFavorite.add(wordsModel[index]);
      return;
    }
    wordsFavorite.remove(wordsModel[index]);
  }
}
