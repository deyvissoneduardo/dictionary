import 'package:get/get.dart';
import './favotire_controller.dart';

class FavotireBindings implements Bindings {
  @override
  void dependencies() {
    Get.put(
      FavotireController(),
    );
  }
}
