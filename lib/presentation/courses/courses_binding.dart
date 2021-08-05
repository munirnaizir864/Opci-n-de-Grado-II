import 'package:cruz_roja/presentation/courses/courses_controller.dart';
import 'package:get/get.dart';
import 'package:get/get_instance/get_instance.dart';

class CoursesBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(
      () =>
          CoursesController(userUseCases: Get.find(), loginUseCase: Get.find()),
    );
  }
}
