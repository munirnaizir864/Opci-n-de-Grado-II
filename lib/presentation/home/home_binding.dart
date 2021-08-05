import 'package:cruz_roja/presentation/home/home_controller.dart';
import 'package:get/instance_manager.dart';

class HomeBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(
      () => HomeController(userUseCases: Get.find(), loginUseCase: Get.find()),
      fenix: true,
    );
  }
}
