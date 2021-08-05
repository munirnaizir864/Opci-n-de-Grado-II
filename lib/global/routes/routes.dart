import 'package:cruz_roja/presentation/auth/login/login_binding.dart';
import 'package:cruz_roja/presentation/auth/login/login_page.dart';
import 'package:cruz_roja/presentation/auth/signup/sign_up_binding.dart';
import 'package:cruz_roja/presentation/auth/signup/sign_up_page.dart';
import 'package:cruz_roja/presentation/courses/courses_binding.dart';
import 'package:cruz_roja/presentation/courses/courses_page.dart';
import 'package:cruz_roja/presentation/home/home_binding.dart';
import 'package:cruz_roja/presentation/home/home_page.dart';

import 'package:cruz_roja/presentation/profile/profile_binding.dart';
import 'package:cruz_roja/presentation/profile/curriculum_page.dart';
import 'package:cruz_roja/presentation/profile/requests_page.dart';
import 'package:cruz_roja/presentation/tasks/my_tasks_binding.dart';
import 'package:cruz_roja/presentation/tasks/my_tasks_page.dart';

import 'package:get/get.dart';

import '../../main_binding.dart';

class AppRoutes {
  //static final String splash = '/splash';
  static final String login = '/login';
  static final String signUp = '/signUp';
  static final String home = '/home';
  static final String profile = '/profile';
  static final String myTasks = '/myTasks';
  static final String courses = '/courses';
  static final String requests = '/requests';
}

class AppPages {
  static final pages = [
    // GetPage(
    //   name: AppRoutes.splash,
    //   page: ()=> SplashPage(),
    //   binding: SplashBinding()
    // ),
    GetPage(
      name: AppRoutes.login,
      page: () => LoginPage(),
      bindings: [MainBinding(), LoginBinding()],
    ),
    GetPage(
      name: AppRoutes.signUp,
      page: () => SignUpPage(),
      bindings: [MainBinding(), SignUpBinding()],
    ),
    GetPage(
      name: AppRoutes.home,
      page: () => HomePage(),
      bindings: [MainBinding(), HomeBinding()],
    ),
    GetPage(
      name: AppRoutes.profile,
      page: () => ProfilePage(),
      bindings: [MainBinding(), ProfileBinding()],
    ),
    GetPage(
      name: AppRoutes.myTasks,
      page: () => MyTasksPage(),
      bindings: [MainBinding(), MyTasksBinding()],
    ),
    GetPage(
      name: AppRoutes.courses,
      page: () => CoursesPage(),
      bindings: [MainBinding(), CoursesBinding()],
    ),
    GetPage(
      name: AppRoutes.requests,
      page: () => RequestsPage(),
      bindings: [MainBinding(), ProfileBinding()],
    ),
  ];
}
