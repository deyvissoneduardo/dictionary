import 'package:get/get.dart';

import '../../core/local_storage/local_storage.dart';
import '../../core/local_storage/shared_preferences_local_storage_impl.dart';
import '../../core/rest_client/rest_client.dart';
import '../bottom_bar/bottom_bar_bindings.dart';
import '../favotire/favotire_bindings.dart';
import '../home/home_bindings.dart';

class CoreBindings implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => RestClient(), fenix: true);
    Get.lazyPut<LocalStorage>(
      () => SharedPreferencesLocalStorageImpl(),
      fenix: true,
    );

    BottomBarBindings().dependencies();
    HomeBindings().dependencies();
    FavotireBindings().dependencies();
  }
}
