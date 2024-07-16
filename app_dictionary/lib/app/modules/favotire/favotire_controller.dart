import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../core/ui/helpers/constants.dart';

class FavotireController extends GetxController
    with GetSingleTickerProviderStateMixin {
  late RxList<String> wordsFavorite = <String>[].obs;

  late AnimationController controller;
  late Animation<Color?> colorPrimary;
  late Animation<Color?> colorSecondary;

  @override
  void onInit() {
    _loadWordsFavorites();
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
    _loadWordsFavorites();
    super.onReady();
  }

  @override
  void onClose() {
    controller.dispose();
    super.onClose();
  }

  void _loadWordsFavorites() async {
    final sp = await SharedPreferences.getInstance();
    final words = sp.getStringList(Constants.WORDSFAVORITES);
    wordsFavorite.addAll(words!);
  }
}
