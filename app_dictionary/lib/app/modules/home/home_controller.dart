import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../core/fp/either.dart';
import '../../services/local/load_words_service.dart';

class HomeController extends GetxController
    with GetSingleTickerProviderStateMixin {
  final LoadWordsService _loadWordsService;

  late RxList<String> wordsModel = <String>[].obs;
  late RxList<String> wordsFavorite = <String>[].obs;

  RxString erroMessage = ''.obs;
  RxBool isLoading = false.obs;

  late AnimationController controller;
  late Animation<Color?> colorPrimary;
  late Animation<Color?> colorSecondary;

  HomeController({
    required LoadWordsService loadWordsService,
  }) : _loadWordsService = loadWordsService;

  @override
  void onInit() {
    _loadWordsLocal();
    controller = AnimationController(
      duration: const Duration(seconds: 3),
      vsync: this,
      reverseDuration: const Duration(seconds: 3),
      upperBound: 5.0,
    )..repeat(reverse: true);

    colorPrimary = ColorTween(
      begin: Colors.blue,
      end: Colors.blue,
    ).animate(controller);

    colorSecondary = ColorTween(
      begin: Colors.purple,
      end: Colors.purple,
    ).animate(controller);
    super.onInit();
  }

  @override
  void onClose() {
    controller.dispose();
    super.onClose();
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
