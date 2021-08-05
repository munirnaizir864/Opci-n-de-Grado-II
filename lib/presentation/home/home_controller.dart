import 'package:cruz_roja/domain/entities/task_entity.dart';
import 'package:cruz_roja/domain/entities/user_entity.dart';
import 'package:cruz_roja/domain/usecases/auth_usecase.dart';
import 'package:cruz_roja/domain/usecases/user_usecase.dart';
import 'package:cruz_roja/global/dynamic_lists.dart';
import 'package:cruz_roja/presentation/auth/login/login_controller.dart';
import 'package:get/get.dart';

class HomeController extends GetxController {
  final UserUseCases userUseCases;
  final AuthUseCase loginUseCase;

  HomeController({this.loginUseCase, this.userUseCases});

  Rx<UserEntity> user = UserEntity().obs;
  RxList<TaskEntity> tasks = <TaskEntity>[].obs;
  RxInt indexSelected = 0.obs;
  int id = Get.find<LoginController>().userId.value;
  RxBool isAccepted = false.obs;

  @override
  void onInit() {
    //loadCurrentTheme();
    loadTaskList();
    loadUser(id);
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  void loadTaskList() async {
    final list = await userUseCases.getAvailableTasks(id);
    tasks.assignAll(list);
  }

  void updateIndex(int index) {
    indexSelected(index);
  }

  void acceptTask(int userId, int activityId) async {
    final value = await userUseCases.acceptTask(userId, activityId);
    isAccepted(value);
    loadTaskList();
  }

  void loadUser(int userId) {
    loginUseCase.getUserFromId(id).then((value) {
      user(value);
    });
  }

  void updateBool(bool isExpanded) {
    isExpanded = !isExpanded;
  }

  Future<void> logOut() async {
    final token = await userUseCases.getToken();
    await loginUseCase.logout(token);
    // final isDark = await userUseCases.isDarkTheme();
    // await userUseCases.saveDarkTheme(isDark);
    await userUseCases.clearAllData();
  }

  // void loadCurrentTheme(){
  //   userUseCases.isDarkTheme().then((value) {
  //     isDark(value);
  //   });
  // }

  // bool onChangeTheme(bool isDarkTheme) {
  //   userUseCases.saveDarkTheme(isDarkTheme);
  //   isDark(isDarkTheme);
  //   return isDarkTheme;
  // }

}
