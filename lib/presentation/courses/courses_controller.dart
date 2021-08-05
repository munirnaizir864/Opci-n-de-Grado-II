import 'package:cruz_roja/data/models/course_model.dart';
import 'package:cruz_roja/domain/entities/course_entity.dart';
import 'package:cruz_roja/domain/entities/dynamic_entity.dart';
import 'package:cruz_roja/domain/usecases/auth_usecase.dart';
import 'package:cruz_roja/domain/usecases/user_usecase.dart';
import 'package:cruz_roja/presentation/auth/login/login_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CoursesController extends GetxController {
  final UserUseCases userUseCases;
  final AuthUseCase loginUseCase;

  CoursesController({this.loginUseCase, this.userUseCases});

  //Rx<UserEntity> user = UserEntity.empty().obs;

  RxInt indexSelected = 0.obs;
  RxBool isDone = false.obs;
  RxBool isExpanded = false.obs;
  RxList<CourseEntity> coursesByUser = <CourseEntity>[].obs;
  RxList<CourseEntity> courses = <CourseEntity>[].obs;

  final courseNameController = TextEditingController();
  final courseStartDateController = TextEditingController();
  RxString auxStartDate = ''.obs;
  final courseEndDateController = TextEditingController();
  final courseDeliveryDateController = TextEditingController();
  RxString auxEndDate = ''.obs;
  RxString auxDeliveryDate = ''.obs;
  final courseActaNumberController = TextEditingController();
  final courseTypeController = TextEditingController();
  final courseTotalHoursController = TextEditingController();
  final courseVerifiedByController = TextEditingController();

  RxString courseCreated = ''.obs;
  Rx<DynamicEntity> categoryEntity = Rx<DynamicEntity>();

  RxBool isValidDate = false.obs;

  RxBool isCreateNewCourse = false.obs;
  int id = Get.find<LoginController>().userId.value;

  @override
  void onInit() {
    loadCourses();
    super.onInit();
  }

  void loadCourses() async {
    final userCourses = await userUseCases.getCoursesByUser(id);
    coursesByUser.assignAll(userCourses);
  }

  Future<void> createCourse(int userId, CourseModel course) async {
    final result = await userUseCases.createCourse(userId, course);
    courseCreated(result);
    loadCourses();
  }

  void validateDates(DateTime date1, DateTime date2) {
    if ((date2.difference(date1).inDays >= 0) &&
        (date2.difference(date1).inMinutes > 0)) {
      isValidDate(true);
    } else {
      isValidDate(false);
    }
  }

  void clearControllers() {
    courseNameController.clear();
    courseActaNumberController.clear();
    courseDeliveryDateController.clear();
    courseActaNumberController.clear();
    courseEndDateController.clear();
    courseStartDateController.clear();
    courseVerifiedByController.clear();
    courseTotalHoursController.clear();
    courseTypeController.clear();
  }

  @override
  void dispose() {
    courseNameController.dispose();
    courseActaNumberController.dispose();
    courseDeliveryDateController.dispose();
    courseActaNumberController.dispose();
    courseEndDateController.dispose();
    courseStartDateController.dispose();
    courseVerifiedByController.dispose();
    courseTotalHoursController.dispose();
    courseTypeController.dispose();
    super.dispose();
  }
}
