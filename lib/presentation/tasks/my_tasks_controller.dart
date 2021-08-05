import 'package:cruz_roja/domain/entities/task_entity.dart';
import 'package:cruz_roja/domain/usecases/auth_usecase.dart';
import 'package:cruz_roja/domain/usecases/user_usecase.dart';
import 'package:cruz_roja/global/dynamic_lists.dart';
import 'package:cruz_roja/presentation/auth/login/login_controller.dart';
import 'package:get/get.dart';

class MyTasksController extends GetxController {
  final UserUseCases userUseCases;
  final AuthUseCase loginUseCase;

  MyTasksController({this.loginUseCase, this.userUseCases});

  //Rx<UserEntity> user = UserEntity.empty().obs;
  RxList<TaskEntity> myTasks = <TaskEntity>[].obs;
  RxList<TaskEntity> completedTasks = <TaskEntity>[].obs;
  RxInt indexSelected = 0.obs;
  RxBool isDone = false.obs;
  RxBool isExpanded = false.obs;
  int id = Get.find<LoginController>().userId.value;

  @override
  void onInit() {
    //loadCurrentTheme();
    loadTaskList();
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  void loadTaskList() async {
    final list = await userUseCases.getUserTasks(id);
    final completedList = await userUseCases.getCompletedTasks(id);

    completedTasks.assignAll(completedList);
    completedTasks.refresh();
    myTasks.assignAll(list);
  }

  void markTaskAsDone(TaskEntity task) {
    myTasks.remove(task);
    final temp = List<TaskEntity>.from(completedTasks);
    temp.add(task);
    completedTasks.assignAll(temp);
  }

  void updateIsExpanded() {
    isExpanded.toggle();
  }

  void taskIsDone(TaskEntity task) {}
  // void updateIndex(int index) {
  //   indexSelected(index);
  // }

  // void loadUser() {
  //   userUseCases.getUser().then((value) {
  //     user(value);
  //   });
  // }

}
