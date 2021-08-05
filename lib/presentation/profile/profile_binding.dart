import 'package:cruz_roja/presentation/profile/profile_controller.dart';
import 'package:get/instance_manager.dart';

class ProfileBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(
        () => ProfileController(
            userUseCases: Get.find(), loginUseCase: Get.find()),
        fenix: true);
  }
}
