import 'package:get/get.dart';

import '../modules/home/home_bindings.dart';
import '../modules/home/home_page.dart';

class AppRouters {
  static const HOMEPAGE = '/';

  static List<GetPage> get pages => [
        GetPage(
          name: HOMEPAGE,
          page: () => const HomePage(),
          binding: HomeBindings(),
        ),
      ];
}
