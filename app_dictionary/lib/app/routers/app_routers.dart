import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../modules/bottom_bar/bottom_bar_bindings.dart';
import '../modules/bottom_bar/bottom_bar_page.dart';
import '../modules/favotire/favotire_bindings.dart';
import '../modules/favotire/favotire_page.dart';
import '../modules/home/home_bindings.dart';
import '../modules/home/home_page.dart';

class AppRouters {
  static const BOTTOMBAR = '/';
  static const HOMEPAGE = '/home';
  static const FAVORITEPAGE = '/favorite';

  static List<GetPage> get pages => [
        GetPage(
          name: BOTTOMBAR,
          page: () => const BottomBarPage(),
          binding: BottomBarBindings(),
          transition: Transition.leftToRight,
          curve: Curves.easeIn,
        ),
        GetPage(
          name: HOMEPAGE,
          page: () => const HomePage(),
          binding: HomeBindings(),
        ),
        GetPage(
          name: FAVORITEPAGE,
          page: () => const FavotirePage(),
          binding: FavotireBindings(),
        ),
      ];
}
