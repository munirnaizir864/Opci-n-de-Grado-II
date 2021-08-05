import 'package:cruz_roja/global/theme/theme.dart';
import 'package:cruz_roja/presentation/auth/login/login_controller.dart';
import 'package:cruz_roja/presentation/home/home_controller.dart';
import 'package:cruz_roja/presentation/home/home_page.dart';
import 'package:cruz_roja/presentation/profile/curriculum_page.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';

class CustomDrawer extends GetWidget<HomeController> {
  CustomDrawer({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    //final controller = Get.find<HomeController>();
    // int id = Get.find<LoginController>().userId.value;
    // controller.loadUser(id);
    final TextStyle style = Theme.of(context)
        .textTheme
        .bodyText1
        .copyWith(fontSize: 14.0.sp, fontWeight: FontWeight.w700);
    final TextStyle subtitle = Theme.of(context)
        .textTheme
        .bodyText1
        .copyWith(fontSize: 12.0.sp, fontWeight: FontWeight.normal);
    return Drawer(
      child: ListView(
        children: [
          DrawerHeader(
              decoration: BoxDecoration(
                  color: AppColors.red,
                  border: Border.all(color: AppColors.lightGrey)
                  // gradient: LinearGradient(
                  //     colors: [AppColors.red, AppColors.pink],
                  //     begin: Alignment.centerLeft,
                  //     end: Alignment.centerRight),
                  ),
              child: Image.asset('assets/logo.jpg')),
          ListTile(
            leading: Text('Inicio', style: style),
            onTap: () {
              Get.back();
              Get.offNamed('/home');
            },
          ),
          ListTile(
            leading: Text(
              'Mis actividades',
              style: style,
            ),
            onTap: () {
              Get.back();
              Get.offNamed('/myTasks');
            },
          ),
          ListTile(
            leading: Text(
              'Cursos',
              style: style,
            ),
            onTap: () {
              Get.back();
              Get.offNamed('/courses');
            },
          ),
          Obx(
            () => controller.user.value.status == null
                ? SizedBox.shrink()
                : ListTile(
                    leading: Text(
                      'Perfil',
                      style: style,
                    ),
                    trailing: Text(
                      controller.user.value.status == 0 ? '' : 'Inactivo',
                      style: Theme.of(context).textTheme.bodyText2.copyWith(
                          fontWeight: FontWeight.bold, color: Colors.red[900]),
                    ),
                    onTap: () {
                      Get.back();
                      Get.offNamed('/profile');
                    },
                  ),
          ),
          Obx(
            () => controller.user.value.status == null
                ? SizedBox.shrink()
                : ListTile(
                    dense: true,
                    contentPadding: EdgeInsets.only(left: 8.0.w),
                    title: Text(
                      'Hoja de vida',
                      style: subtitle,
                    ),
                    onTap: () {
                      Get.back();
                      Get.offNamed('/profile');
                    },
                  ),
          ),
          Obx(
            () => controller.user.value.status == null
                ? SizedBox.shrink()
                : ListTile(
                    dense: true,
                    contentPadding: EdgeInsets.only(left: 8.0.w),
                    title: Text(
                      'Pasaporte y solicitud de reactivación',
                      style: subtitle,
                    ),
                    onTap: () {
                      Get.back();
                      Get.offNamed('/requests');
                    },
                  ),
          )
        ],
      ),
    );
  }
}
