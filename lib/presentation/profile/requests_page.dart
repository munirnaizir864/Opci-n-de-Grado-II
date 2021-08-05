import 'dart:io';

import 'package:cruz_roja/global/theme/theme.dart';
import 'package:cruz_roja/global/utils.dart';
import 'package:cruz_roja/presentation/auth/widgets/custom_button.dart';
import 'package:cruz_roja/presentation/home/widgets/drawer.dart';
import 'package:cruz_roja/presentation/profile/profile_controller.dart';
import 'package:cruz_roja/presentation/profile/widgets/upload_file.dart';
import 'package:file_picker/file_picker.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';
import 'package:flutter/material.dart';

class RequestsPage extends StatefulWidget {
  @override
  _RequestsPageState createState() => _RequestsPageState();
}

class _RequestsPageState extends State<RequestsPage> {
  final controller = Get.find<ProfileController>();
  File _passport;
  File _reactivation;
  String _passportPath;
  String _reactivationPath;

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
      body: Padding(
        padding: EdgeInsets.symmetric(vertical: 3.0.h, horizontal: 5.0.w),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            UploadFile(
              text: 'Subir pasaporte',
              text2: 'Selecciona un pdf con tu pasaporte',
              path: _passportPath,
              pickFile: () async {
                FilePickerResult result = await FilePicker.platform.pickFiles(
                    type: FileType.custom, allowedExtensions: ['pdf']);
                if (result != null) {
                  PlatformFile file = result.files.first;
                  setState(() {
                    _passport = File(file.path);
                    _passportPath = file.name;
                  });
                  print(file.name);
                  print(file.bytes);
                  print(file.size);
                  print(file.extension);
                  print(file.path);
                } else {
                  // User canceled the picker
                }
              },
              uploadFile: _passport == null
                  ? null
                  : () {
                      uploadDocument(
                          _passport,
                          controller.user.value.documentNumber,
                          'pasaporte',
                          'Su pasaporte se ha subido con éxito',
                          'No se ha podido subir el pasaporte');
                    },
            ),
            const SizedBox(
              height: 10.0,
            ),
            UploadFile(
              text: 'Subir solicitud de reactivación',
              text2: 'Selecciona un pdf con tu solicitud de reactivación',
              path: _reactivationPath,
              pickFile: () async {
                FilePickerResult result = await FilePicker.platform.pickFiles(
                    type: FileType.custom, allowedExtensions: ['pdf']);
                if (result != null) {
                  PlatformFile file = result.files.first;
                  setState(() {
                    _reactivation = File(file.path);
                    _reactivationPath = file.name;
                  });
                  print(file.name);
                  print(file.bytes);
                  print(file.size);
                  print(file.extension);
                  print(file.path);
                } else {
                  // User canceled the picker
                }
              },
              uploadFile: _reactivation == null
                  ? null
                  : () {
                      uploadDocument(
                          _reactivation,
                          controller.user.value.documentNumber,
                          'solicitudReactivacion',
                          'Su solicitud de reactivación se ha subido con éxito',
                          'No se ha podido subir su solicitud de reactivación');
                    },
            ),
          ],
        ),
      ),
      drawer: CustomDrawer(),
    );
  }

  void uploadDocument(File file, String documentNumber, String type,
      String mensaje, String errorMessage) async {
    final result = await controller.uploadPassport(file, documentNumber, type);
    if (result) {
      Dialogs.alert(context, title: 'Información', description: mensaje);
    } else {
      Dialogs.alert(context, title: 'Información', description: errorMessage);
    }
  }
}
