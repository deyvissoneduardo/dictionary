import 'package:get/get.dart';
import './bottom_bar_controller.dart';

class BottomBarBindings implements Bindings {
    @override
    void dependencies() {
        Get.put(BottomBarController());
    }
}