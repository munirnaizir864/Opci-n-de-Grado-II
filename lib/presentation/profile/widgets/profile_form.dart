import 'dart:io';

import 'package:cruz_roja/data/models/user_model.dart';
import 'package:cruz_roja/global/dynamic_lists.dart';
import 'package:cruz_roja/global/theme/theme.dart';
import 'package:cruz_roja/global/utils.dart';
import 'package:cruz_roja/presentation/auth/login/login_controller.dart';
import 'package:cruz_roja/presentation/auth/widgets/custom_button.dart';
import 'package:cruz_roja/presentation/auth/widgets/custom_textfield.dart';
import 'package:cruz_roja/presentation/profile/profile_controller.dart';
import 'package:cruz_roja/presentation/profile/widgets/dropdown.dart';
import 'package:cruz_roja/presentation/profile/widgets/label_and_radio_buttons.dart';
import 'package:cruz_roja/presentation/profile/widgets/label_and_textfield.dart';
import 'package:cruz_roja/presentation/profile/widgets/triangle_button.dart';
import 'package:cruz_roja/presentation/profile/widgets/upload_file.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:sizer/sizer.dart';

class ProfileForm extends StatefulWidget {
  @override
  _ProfileFormState createState() => _ProfileFormState();
}

class _ProfileFormState extends State<ProfileForm> {
  PageController _pageController = PageController();
  final controller = Get.find<ProfileController>();
  int id = Get.find<LoginController>().userId.value;
  GlobalKey<FormState> _formKey1;

  int currentIndex = 0;
  @override
  void initState() {
    _formKey1 = GlobalKey<FormState>();
    _pageController.addListener(() {
      setState(() {
        currentIndex = _pageController.page.toInt();
      });
    });
    super.initState();
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  List<Widget> _pages = [Page1(), Page2(), Page3(), Page4()];
  static const _kDuration = const Duration(milliseconds: 300);
  static const _kCurve = Curves.ease;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Container(
      //height: size.height,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Expanded(
            child: PageView.builder(
              physics: NeverScrollableScrollPhysics(),
              controller: _pageController,
              itemCount: _pages.length,
              itemBuilder: (BuildContext context, int index) {
                return _pages[index % _pages.length];
              },
            ),
          ),
          Row(
            //mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.end,
            children: <Widget>[
              currentIndex == 0
                  ? SizedBox.shrink()
                  : Row(
                      children: [
                        TriangleButton(
                          direction: -5.0.h,
                          onTap: () {
                            _pageController.previousPage(
                                duration: _kDuration, curve: _kCurve);
                          },
                        ),
                      ],
                    ),
              currentIndex == 3
                  ? SizedBox.shrink()
                  : Row(
                      children: [
                        TriangleButton(
                          onTap: () {
                            _pageController.nextPage(
                                duration: _kDuration, curve: _kCurve);
                          },
                        ),
                      ],
                    ),
              currentIndex == 3
                  ? CustomButton(
                      height: 40,
                      width: 80,
                      text: Text(
                        'Guardar',
                        style: TextStyle(color: AppColors.white),
                      ),
                      backgroundColor: AppColors.red,
                      onPressed: () {
                        _save();
                      },
                    )
                  : SizedBox.shrink()
            ],
          )
        ],
      ),
    );
  }

  void saveForm1() {}

  void _save() async {
    final user = UserModel(
      id: id,
      email: controller.user.value.email,
      carneNumber: controller.noCarne.value,
      name: controller.nameController.text,
      surname: controller.surnameController.text,
      documentType: controller.documentTypeEntity.value == null
          ? null
          : controller.documentTypeEntity.value.id,
      documentNumber: controller.documentNumberController.text,
      dateOfBirth: controller.auxDateOfBirth.value == null ||
              controller.auxDateOfBirth.value == ''
          ? null
          : DateTime.parse(controller.auxDateOfBirth.value)
              .toIso8601String(), //"1994-11-18"//controller.dateOfBirthController.text,
      civilStatus: controller.civilStatusEntity.value == null
          ? null
          : controller.civilStatusEntity.value.id,
      gender: controller.gender.value == null
          ? null
          : controller.gender.value == 0
              ? 1
              : 2,
      address: controller.addressController.text,
      department: controller.departmentController.text,
      city: controller.cityController.text,
      homePhone: controller.homePhoneController.text,
      cellPhone: controller.cellPhoneController.text,
      entailmentType: controller.entailmentTypeEntity.value == null
          ? null
          : controller.entailmentTypeEntity.value.id,
      dateOfEntry: controller.auxDateOfEntry.value == null ||
              controller.auxDateOfEntry.value == ''
          ? null
          : DateTime.parse(controller.auxDateOfEntry.value)
              .toIso8601String(), //"20210325", //controller.dateOfEntryController.text,
      studyRank: controller.studyRankEntity.value == null
          ? null
          : controller.studyRankEntity.value.id,
      profession: controller.professionController.text,
      position: controller.positionEntity.value == null
          ? null
          : controller.positionEntity.value.id,
      nativeLanguage: controller.nativeLanguageEntity.value == null
          ? null
          : controller.nativeLanguageEntity.value.id,
      secondLanguage: controller.secondLanguageEntity.value == null
          ? null
          : controller.secondLanguageEntity.value.id,
      hasLicense: controller.hasLicense.value == null
          ? null
          : controller.hasLicense.value,
      hasCertificate: controller.hasCertificate.value == null
          ? null
          : controller.hasCertificate.value,
      isInsured: controller.isInsured.value == null
          ? null
          : controller.isInsured.value,
      driveLicenseType: controller.driveLicenseTypeController.text,
      driveLicenseNumber: controller.driveLicenseNumberController.text,
      passportNumber: controller.passportNumberController.text,
      passportExpirationDate:
          controller.auxPassportExpirationDate.value == null ||
                  controller.auxPassportExpirationDate.value == ''
              ? null
              : DateTime.parse(controller.auxPassportExpirationDate.value)
                  .toIso8601String(), // "2021-03-25",
      //controller.passportExpirationDateController.text,
      hasVisa:
          controller.hasVisa.value == null ? null : controller.hasVisa.value,
      eps: controller.epsController.text,
      regime: controller.regime.value == null ? null : controller.regime.value,
      bloodType: controller.bloodTypeController.text,
      height: controller.heightController.text,
      weight: controller.weightController.text,
      hasGlasses: controller.hasGlasses.value == null
          ? null
          : controller.hasGlasses.value,
      emergencyContactName: controller.emergencyContactNameController.text,
      emergencyContactAddress:
          controller.emergencyContactAddressController.text,
      emergencyContactNumber: controller.emergencyContactNumberController.text,
      voluntaryGroupId: 4,
      carnetizado: controller.carnetizado.value == null
          ? null
          : controller.carnetizado.value,
    );
    print(user.name);

    final result = await controller.updateUser(user);
    if (result) {
      Dialogs.alert(context,
          title: 'Su hoja de vida fue actualizada exitosamente');
      controller.loadUser(Get.find<LoginController>().userId.value);
    } else {
      Dialogs.alert(context,
          title:
              'No se ha podido actualizar su hoja de vida, vuelva a intentarlo más tarde');
    }
  }
}

class Page1 extends StatefulWidget {
  final GlobalKey<FormState> formkey;
  Page1({Key key, this.formkey}) : super(key: key);

  @override
  _Page1State createState() => _Page1State();
}

class _Page1State extends State<Page1> {
  final controller = Get.find<ProfileController>();
  GlobalKey<FormState> _formKey1;

  @override
  void initState() {
    _formKey1 = GlobalKey<FormState>();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Obx(
        () => Column(
          children: [
            LabelAndTextfield(
              text: 'Nombre: ',
              controller: controller.nameController,
            ),
            LabelAndTextfield(
              text: 'Apellidos: ',
              controller: controller.surnameController,
            ),
            LabelAndDropDown(
              dynamiList: documentTypeList,
              hintText: 'Tipo de documento',
              text: 'Tipo de documento',
              dynamicEntity: controller.documentTypeEntity.value,
              onChanged: (value) {
                controller.documentTypeEntity(value);
              },
              validator: (value) {
                if (value == null)
                  return 'Por favor selecciona un tipo de documento';
              },
            ),
            LabelAndTextfield(
              text: 'No. documento: ',
              controller: controller.documentNumberController,
            ),
            LabelAndTextfield(
              text: 'Fecha de nacimiento: ',
              controller: controller.dateOfBirthController,
              focusNode: AlwaysDisabledFocusNode(),
              onTap: () async {
                DateTime _selectedDate;
                DateTime picked = await showDatePicker(
                    context: context,
                    builder: (context, child) {
                      return Theme(
                        child: child,
                        data: ThemeData(
                            colorScheme: ColorScheme.light(
                          primary: AppColors.appBarText,
                        )),
                      );
                    },
                    initialDate: new DateTime.now(),
                    firstDate: new DateTime(1900),
                    lastDate: new DateTime(2025),
                    locale: Locale('en', 'US'));

                if (picked != null) {
                  _selectedDate = picked;
                  controller.auxDateOfBirth.value =
                      DateFormat('yyyy-MM-dd').format(_selectedDate);

                  controller.dateOfBirthController
                    ..text = DateFormat('dd/MM/yyyy').format(_selectedDate)
                    ..selection = TextSelection.fromPosition(TextPosition(
                        offset: controller.dateOfBirthController.text.length,
                        affinity: TextAffinity.upstream));
                }
              },
            ),
            LabelAndDropDown(
              dynamiList: civilStatusList,
              hintText: 'Estado Civil',
              text: 'Estado Civil',
              dynamicEntity: controller.civilStatusEntity.value,
              onChanged: (value) {
                controller.civilStatusEntity(value);
              },
            ),
            LabelAndRadioButtons(
              label: 'Genero: ',
              radio1: 'F',
              radio2: 'M',
              groupValue: controller.gender.value,
              onChanged1: (value) {
                controller.updateIndex(controller.gender, value);
              },
              onChanged2: (value) {
                controller.updateIndex(controller.gender, value);
              },
            ),
            LabelAndTextfield(
              text: 'Dirección domicilio: ',
              controller: controller.addressController,
            ),
            LabelAndTextfield(
              text: 'Departamento: ',
              controller: controller.departmentController,
            ),
          ],
        ),
      ),
    );
  }
}

class Page2 extends StatelessWidget {
  Page2({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<ProfileController>();
    return Obx(
      () => SingleChildScrollView(
        child: Column(
          children: [
            LabelAndTextfield(
              text: 'Ciudad/Municipio: ',
              controller: controller.cityController,
            ),
            LabelAndTextfield(
              text: 'Teléfono domicilio: ',
              controller: controller.homePhoneController,
            ),
            LabelAndTextfield(
              text: 'Celular: ',
              controller: controller.cellPhoneController,
            ),
            LabelAndDropDown(
              dynamiList: entailmentList,
              hintText: 'Tipo de vinculación',
              text: 'Tipo de vinculación',
              dynamicEntity: controller.entailmentTypeEntity.value,
              onChanged: (value) {
                controller.entailmentTypeEntity(value);
              },
            ),
            LabelAndTextfield(
              text: 'Fecha de ingreso: ',
              controller: controller.dateOfEntryController,
              focusNode: AlwaysDisabledFocusNode(),
              onTap: () async {
                DateTime _selectedDate;
                DateTime picked = await showDatePicker(
                    context: context,
                    builder: (context, child) {
                      return Theme(
                        child: child,
                        data: ThemeData(
                            colorScheme: ColorScheme.light(
                          primary: AppColors.appBarText,
                        )),
                      );
                    },
                    initialDate: new DateTime.now(),
                    firstDate: new DateTime(1900),
                    lastDate: new DateTime(2025),
                    locale: Locale('en', 'US'));

                if (picked != null) {
                  _selectedDate = picked;
                  controller.auxDateOfEntry.value =
                      DateFormat('yyyy-MM-dd').format(_selectedDate);
                  controller.dateOfEntryController
                    ..text = DateFormat('dd/MM/yyyy').format(_selectedDate)
                    ..selection = TextSelection.fromPosition(TextPosition(
                        offset: controller.dateOfEntryController.text.length,
                        affinity: TextAffinity.upstream));
                }
              },
            ),
            LabelAndDropDown(
              dynamiList: studyRankList,
              hintText: 'Rango más alto de estudio',
              text: 'Rango más alto de estudio',
              dynamicEntity: controller.studyRankEntity.value,
              onChanged: (value) {
                controller.studyRankEntity(value);
              },
            ),
            LabelAndTextfield(
              text: 'Profesión: ',
              controller: controller.professionController,
            ),
            LabelAndDropDown(
              dynamiList: positionList,
              hintText: 'Cargo',
              text: 'Cargo',
              dynamicEntity: controller.positionEntity.value,
              onChanged: (value) {
                controller.positionEntity(value);
              },
            ),
            LabelAndDropDown(
              dynamiList: languageList,
              hintText: 'Idioma nativo',
              text: 'Idioma Nativo',
              dynamicEntity: controller.nativeLanguageEntity.value,
              onChanged: (value) {
                controller.nativeLanguageEntity(value);
              },
            ),
          ],
        ),
      ),
    );
  }
}

class Seguro extends StatelessWidget {
  final String text;
  final String text2;
  final VoidCallback pickFile;
  final VoidCallback uploadFile;
  File file;
  final String path;
  Seguro(
      {Key key,
      this.text,
      this.pickFile,
      this.file,
      this.path,
      this.uploadFile,
      this.text2})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          text,
          style:
              Theme.of(context).textTheme.bodyText1.copyWith(fontSize: 12.0.sp),
        ),
        const SizedBox(
          height: 10.0,
        ),
        Row(
          children: [
            Expanded(
              flex: 3,
              child: InkWell(
                onTap: pickFile,
                child: Container(
                  height: 40.0,
                  padding: const EdgeInsets.symmetric(
                      vertical: 8.0, horizontal: 10.0),
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.white),
                    borderRadius: BorderRadius.circular(5.0),
                    color: Colors.white,
                  ),
                  child: Text(
                    path != null ? path : text2,
                    style: TextStyle(color: Colors.grey, fontSize: 10.0.sp),
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }
}

class Page3 extends StatefulWidget {
  Page3({Key key}) : super(key: key);

  @override
  _Page3State createState() => _Page3State();
}

class _Page3State extends State<Page3> {
  final controller = Get.find<ProfileController>();
  String _path = '';
  File seguro;

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<ProfileController>();
    return SingleChildScrollView(
      child: Obx(
        () => Column(
          children: [
            LabelAndDropDown(
              dynamiList: languageList,
              hintText: 'Idioma secundario',
              text: 'Idioma secundario',
              dynamicEntity: controller.secondLanguageEntity.value,
              onChanged: (value) {
                controller.secondLanguageEntity(value);
              },
            ),
            LabelAndRadioButtons(
              label: 'Licencia:',
              radio1: 'Si',
              radio2: 'No',
              groupValue: controller.hasLicense.value,
              onChanged1: (value) {
                controller.updateIndex(controller.hasLicense, value);
              },
              onChanged2: (value) {
                controller.updateIndex(controller.hasLicense, value);
              },
            ),
            LabelAndRadioButtons(
              label: 'Certificado:',
              radio1: 'Si',
              radio2: 'No',
              groupValue: controller.hasCertificate.value,
              onChanged1: (value) {
                controller.updateIndex(controller.hasCertificate, value);
              },
              onChanged2: (value) {
                controller.updateIndex(controller.hasCertificate, value);
              },
            ),
            LabelAndRadioButtons(
              label: 'Asegurado: ',
              radio1: 'Si',
              radio2: 'No',
              groupValue: controller.isInsured.value,
              onChanged1: (value) {
                controller.updateIndex(controller.isInsured, value);
              },
              onChanged2: (value) {
                controller.updateIndex(controller.isInsured, value);
              },
            ),
            LabelAndTextfield(
              text: 'Tipo de licencia de conducción: ',
              controller: controller.driveLicenseTypeController,
            ),
            LabelAndTextfield(
              text: 'No. licencia de conducción: ',
              controller: controller.driveLicenseNumberController,
            ),
            LabelAndTextfield(
              text: 'No. pasaporte: ',
              controller: controller.passportNumberController,
            ),
            LabelAndTextfield(
              text: 'Fecha vencimiento pasaporte: ',
              controller: controller.passportExpirationDateController,
              focusNode: AlwaysDisabledFocusNode(),
              onTap: () async {
                DateTime _selectedDate;
                DateTime picked = await showDatePicker(
                    context: context,
                    builder: (context, child) {
                      return Theme(
                        child: child,
                        data: ThemeData(
                            colorScheme: ColorScheme.light(
                          primary: AppColors.appBarText,
                        )),
                      );
                    },
                    initialDate: new DateTime.now(),
                    firstDate: new DateTime(1900),
                    lastDate: new DateTime(2025),
                    locale: Locale('en', 'US'));

                if (picked != null) {
                  _selectedDate = picked;
                  controller.auxPassportExpirationDate.value =
                      DateFormat('yyyy-MM-dd').format(_selectedDate);
                  controller.passportExpirationDateController
                    ..text = DateFormat('dd/MM/yyyy').format(_selectedDate)
                    ..selection = TextSelection.fromPosition(TextPosition(
                        offset: controller
                            .passportExpirationDateController.text.length,
                        affinity: TextAffinity.upstream));
                }
              },
            ),
            Seguro(
              text: 'Subir seguro',
              text2: _path != '' ? _path : 'Selecciona un pdf con tu seguro',
              path: _path,
              pickFile: () async {
                FilePickerResult result = await FilePicker.platform.pickFiles(
                    type: FileType.custom, allowedExtensions: ['pdf']);
                if (result != null) {
                  PlatformFile file = result.files.first;
                  setState(() {
                    seguro = File(file.path);
                    _path = file.name;
                  });
                  print(file.name);
                  print(file.bytes);
                  print(file.size);
                  print(file.extension);
                  print(file.path);
                  uploadDocument(
                      seguro,
                      controller.user.value.documentNumber,
                      'seguro',
                      'Su seguro se ha subido con éxito',
                      'No se ha podido subir el seguro');
                } else {
                  // User canceled the picker
                }
              },
            ),
          ],
        ),
      ),
    );
  }

  void uploadDocument(File file, String documentNumber, String type,
      String mensaje, String errorMessage) async {
    final result = await controller.uploadPassport(file, documentNumber, type);
    if (result) {
      print('se subió el seguro');
      // Dialogs.alert(context, title: 'Información', description: mensaje);
    } else {
      Dialogs.alert(context, title: 'Información', description: errorMessage);
    }
  }
}

class Page4 extends StatelessWidget {
  final controller = Get.find<ProfileController>();
  Page4({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Obx(
        () => Column(
          children: [
            LabelAndRadioButtons(
              label: 'Visa',
              radio1: 'Si',
              radio2: 'No',
              groupValue: controller.hasVisa.value,
              onChanged1: (value) {
                controller.updateIndex(controller.hasVisa, value);
              },
              onChanged2: (value) {
                controller.updateIndex(controller.hasVisa, value);
              },
            ),
            LabelAndTextfield(
              text: 'EPS: ',
              controller: controller.epsController,
            ),
            LabelAndRadioButtons(
              label: '',
              radio1: 'Contributivo',
              radio2: 'Subsidiado',
              groupValue: controller.regime.value,
              onChanged1: (value) {
                controller.updateIndex(controller.regime, value);
              },
              onChanged2: (value) {
                controller.updateIndex(controller.regime, value);
              },
            ),
            LabelAndTextfield(
              text: 'Tipo de sangre: ',
              controller: controller.bloodTypeController,
            ),
            LabelAndTextfield(
              text: 'Estatura: ',
              controller: controller.heightController,
            ),
            LabelAndTextfield(
              text: 'Peso: ',
              controller: controller.weightController,
            ),
            LabelAndRadioButtons(
              label: 'Gafas:',
              radio1: 'Si',
              radio2: 'No',
              groupValue: controller.hasGlasses.value,
              onChanged1: (value) {
                controller.updateIndex(controller.hasGlasses, value);
              },
              onChanged2: (value) {
                controller.updateIndex(controller.hasGlasses, value);
              },
            ),
            LabelAndTextfield(
              text: 'Nombre contacto de emergencia: ',
              controller: controller.emergencyContactNameController,
            ),
            LabelAndTextfield(
              text: 'Dirección contacto de emergencia: ',
              controller: controller.emergencyContactAddressController,
            ),
            LabelAndTextfield(
              text: 'Número contacto de emergencia: ',
              controller: controller.emergencyContactNumberController,
            ),
            // LabelAndDropDown(
            //   dynamiList: civilStatusList,
            //   hintText: 'Grupo voluntario',
            //   text: 'Grupo voluntario',
            //   dynamicEntity: controller.civilStatusEntity.value,
            //   onChanged: (value) {
            //     controller.civilStatusEntity(value);
            //   },
            // ),
          ],
        ),
      ),
    );
  }
}
