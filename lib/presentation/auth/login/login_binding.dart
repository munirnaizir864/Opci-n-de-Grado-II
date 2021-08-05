import 'package:cruz_roja/presentation/auth/login/login_controller.dart';
import 'package:get/instance_manager.dart';

class LoginBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<LoginController>(
        () =>
            LoginController(userUseCases: Get.find(), loginUseCase: Get.find()),
        fenix: true);
  }
}
