import 'package:cruz_roja/presentation/tasks/my_tasks_controller.dart';
import 'package:get/instance_manager.dart';

class MyTasksBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(
      () =>
          MyTasksController(userUseCases: Get.find(), loginUseCase: Get.find()),
    );
  }
}
