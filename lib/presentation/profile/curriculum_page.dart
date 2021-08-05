import 'dart:io';

import 'package:cruz_roja/global/theme/theme.dart';
import 'package:cruz_roja/global/utils.dart';
import 'package:cruz_roja/presentation/auth/widgets/custom_button.dart';
import 'package:cruz_roja/presentation/home/home_controller.dart';
import 'package:cruz_roja/presentation/home/widgets/drawer.dart';
import 'package:cruz_roja/presentation/profile/profile_controller.dart';
import 'package:cruz_roja/presentation/profile/widgets/profile_form.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';

class ProfilePage extends StatefulWidget {
  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  final controller = Get.find<ProfileController>();
  File _file;
  String _path;

  @override
  Widget build(BuildContext context) {
    //final homeController = Get.find<HomeController>();
    final size = MediaQuery.of(context).size;
    final statusBarHeight = MediaQuery.of(context).padding.top;

    GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
    return Scaffold(
      appBar: AppBar(
        titleSpacing: 0.0,
        leading: Builder(
          builder: (BuildContext context) {
            return InkWell(
              child: Icon(
                Icons.menu,
                color: Theme.of(context).iconTheme.color,
              ),
              onTap: () {
                Scaffold.of(context).openDrawer();
              },
            );
          },
        ),
        title: Text('Perfil',
            style: Theme.of(context).textTheme.bodyText1.copyWith(
                color: AppColors.appBarText,
                fontSize: 16.0.sp,
                fontWeight: FontWeight.w600)),
      ),
      resizeToAvoidBottomInset: true,
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.symmetric(vertical: 1.0.h, horizontal: 5.0.w),
          height: size.height - kToolbarHeight - statusBarHeight - 1.0.h,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Hoja de vida',
                    style: Theme.of(context)
                        .textTheme
                        .bodyText1
                        .copyWith(fontSize: 15.0.sp),
                  ),
                  const SizedBox(
                    width: 5.0,
                  ),
                  InkWell(
                    child: Icon(
                      Icons.edit,
                      size: 20,
                      color: AppColors.red,
                    ),
                    onTap: () {
                      print(controller.nameController.text +
                          controller.cityController.text +
                          controller.driveLicenseTypeController.text +
                          controller.weightController.text);
                    },
                  ),
                ],
              ),
              Expanded(
                flex: 8,
                child: Container(
                  padding: EdgeInsets.fromLTRB(2.0.w, 1.0.h, 2.0.w, 0),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5.0),
                      //border: Border.all(color: AppColors.lightGrey),
                      color: AppColors.formBackground),
                  child: ProfileForm(),
                ),
              )
            ],
          ),
        ),
      ),
      drawer: CustomDrawer(),
    );
  }
}
