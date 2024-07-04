import 'package:get/get.dart';
import '../../core/rest_client/rest_client.dart';
import '../../repositories/remoto/word_repository_impl.dart';
import './home_controller.dart';

class HomeBindings implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => RestClient(), fenix: true);
    Get.lazyPut(() => WordRepositoryImpl(restClient: Get.find()));
    Get.put(
      HomeController(
        repositoryImpl: Get.find(),
      ),
    );
  }
}
