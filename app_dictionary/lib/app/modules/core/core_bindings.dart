import 'package:get/get.dart';

import '../../core/rest_client/rest_client.dart';
import '../bottom_bar/bottom_bar_bindings.dart';
import '../favotire/favotire_bindings.dart';
import '../home/home_bindings.dart';

class CoreBindings implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => RestClient(), fenix: true);

    BottomBarBindings().dependencies();
    HomeBindings().dependencies();
    FavotireBindings().dependencies();
  }
}
