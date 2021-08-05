import 'package:cruz_roja/global/routes/routes.dart';
import 'package:cruz_roja/global/theme/theme.dart';
import 'package:cruz_roja/main_binding.dart';
import 'package:cruz_roja/presentation/auth/login/login_binding.dart';
import 'package:cruz_roja/presentation/auth/login/login_page.dart';
import 'package:cruz_roja/presentation/auth/signup/sign_up_page.dart';
import 'package:cruz_roja/presentation/home/home_binding.dart';
import 'package:cruz_roja/presentation/home/home_page.dart';
import 'package:cruz_roja/presentation/profile/profile_binding.dart';
import 'package:cruz_roja/presentation/profile/curriculum_page.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sizer/sizer.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  MainBinding().dependencies();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        return OrientationBuilder(builder: (context, orientation) {
          SizerUtil().init(constraints, orientation);
          return GetMaterialApp(
            navigatorKey: Get.key,
            debugShowCheckedModeBanner: false,
            title: 'Flutter Demo',
            theme: lightTheme,
            initialRoute: AppRoutes.login,
            getPages: AppPages.pages,
            home: LoginPage(),
            initialBinding: LoginBinding(),
          );
        });
      },
    );
  }
}
