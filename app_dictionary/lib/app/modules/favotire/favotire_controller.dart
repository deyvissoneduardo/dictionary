import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../core/helpers/constants.dart';

class FavotireController extends GetxController
    with GetSingleTickerProviderStateMixin {
  late AnimationController controller;
  late Animation<Color?> colorPrimary;
  late Animation<Color?> colorSecondary;

  late RxList<String> wordsFavorite = <String>[].obs;
  late RxList<String> wordsModel = <String>[].obs;

  RxBool isLoading = false.obs;

  @override
  void onInit() {
    loadWordsFavorites();
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
  void onReady() {
    loadWordsFavorites();
    super.onReady();
  }

  @override
  void onClose() {
    controller.dispose();
    super.onClose();
  }

  void loadWordsFavorites() async {
    wordsModel.clear();
    wordsFavorite.clear();
    final sp = await SharedPreferences.getInstance();
    final words = sp.getStringList(Constants.WORDSFAVORITES);
    wordsModel.addAll(words!);
    wordsFavorite.addAll(words);
  }

  void favoriteWord(int index) async {
    final sp = await SharedPreferences.getInstance();
    if (!wordsFavorite.contains(wordsModel[index])) {
      wordsFavorite.add(wordsModel[index]);
      sp.setStringList(Constants.WORDSFAVORITES, wordsFavorite);
      return;
    }
    wordsFavorite.remove(wordsModel[index]);
    sp.setStringList(Constants.WORDSFAVORITES, wordsFavorite);
  }
}
