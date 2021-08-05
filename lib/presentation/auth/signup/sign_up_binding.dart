import 'package:cruz_roja/presentation/auth/signup/sign_up_controller.dart';
import 'package:get/instance_manager.dart';

class SignUpBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<SignUpController>(
      () => SignUpController(
          // userUseCases: Get.find(),
          // loginUseCase: Get.find(),
          ),
    );
  }
}
