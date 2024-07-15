import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../favotire/favotire_page.dart';
import '../home/home_page.dart';

class BottomBarController extends GetxController {
  var selectedIndex = 0.obs;

  final List<Widget> pages = [
    const HomePage(),
    const FavotirePage(),
  ];
}
