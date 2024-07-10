import 'package:get/get.dart';

import '../../core/rest_client/rest_client.dart';
import '../home/home_bindings.dart';

class CoreBindings implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => RestClient(), fenix: true);

    HomeBindings().dependencies();
  }
}
