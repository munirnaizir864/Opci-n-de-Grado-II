import 'package:cruz_roja/data/models/course_model.dart';
import 'package:cruz_roja/domain/entities/dynamic_entity.dart';
import 'package:cruz_roja/global/theme/theme.dart';
import 'package:cruz_roja/global/utils.dart';
import 'package:cruz_roja/presentation/auth/login/login_controller.dart';
import 'package:cruz_roja/presentation/auth/widgets/custom_button.dart';
import 'package:cruz_roja/presentation/courses/courses_controller.dart';
import 'package:cruz_roja/presentation/profile/widgets/dropdown.dart';
import 'package:cruz_roja/presentation/profile/widgets/label_and_textfield.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

class CreateNewCourse extends StatefulWidget {
  CreateNewCourse({Key key}) : super(key: key);

  @override
  _CreateNewCourseState createState() => _CreateNewCourseState();
}

class _CreateNewCourseState extends State<CreateNewCourse> {
  final coursesController = Get.find<CoursesController>();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  int id = Get.find<LoginController>().userId.value;
  DateTime startDate;

  final List<DynamicEntity> coursesCategories = [
    DynamicEntity(name: 'Programa Aire Libre', id: 1),
    DynamicEntity(name: 'Recreación', id: 2),
    DynamicEntity(name: 'Paz, Acción y Convivencia', id: 3),
    DynamicEntity(name: 'Sector Escolar', id: 4),
    DynamicEntity(name: 'Tecnologías de la información y comunicación', id: 5),
    DynamicEntity(name: 'Bienestar', id: 6),
    DynamicEntity(name: 'Dirigente', id: 7),
    DynamicEntity(name: 'Infantiles y Prejuveniles', id: 8),
    DynamicEntity(name: 'Administrativo/Juventud', id: 10),
    DynamicEntity(name: 'Reuniones', id: 11),
    DynamicEntity(name: 'Servicios Especiales', id: 12),
    DynamicEntity(name: 'Administrativo/Socorro', id: 13),
    DynamicEntity(name: 'Emergencias', id: 14),
    DynamicEntity(name: 'Cambio Climatico', id: 15),
    DynamicEntity(name: 'Rescate con caninos', id: 16),
    DynamicEntity(name: 'Salvamento acuático', id: 17),
    DynamicEntity(name: 'Rescate', id: 18),
    DynamicEntity(name: 'Dirigentes', id: 19),
    DynamicEntity(name: 'Administrativo', id: 20),
    DynamicEntity(name: 'Socorrismo Universitario', id: 21),
    DynamicEntity(name: 'Reuniones', id: 22),
    DynamicEntity(name: 'Doctrina y Protección', id: 23),
    DynamicEntity(name: 'Zika', id: 24),
    DynamicEntity(name: 'Apoyo psicosocial', id: 25),
    DynamicEntity(name: 'Salud sexual y reproductiva', id: 26),
    DynamicEntity(name: 'Administrativo', id: 27),
    DynamicEntity(name: 'Comunicación e Imagen', id: 28),
    DynamicEntity(name: 'Monitorias', id: 29),
  ];

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Container(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
        child: SingleChildScrollView(
          child: Form(
            key: _formKey,
            child: Column(
              children: [
                LabelAndTextfield(
                  text: 'Nombre',
                  controller: coursesController.courseNameController,
                  validator: (value) {
                    if (value == '') {
                      return 'Por favor ingrese un nombre';
                    } else if (value == null) {
                      return 'Este campo no puede estar vacío';
                    } else {
                      return null;
                    }
                  },
                ),
                LabelAndTextfield(
                  text: 'Fecha de inicio',
                  controller: coursesController.courseStartDateController,
                  validator: (value) {
                    if (value == '') {
                      return 'Por favor seleccione una fecha de inicio';
                    }
                  },
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
                      startDate = picked;
                      coursesController.auxStartDate.value =
                          DateFormat('yyyy-MM-dd').format(_selectedDate);
                      coursesController.courseStartDateController
                        ..text = DateFormat('dd/MM/yyyy').format(_selectedDate)
                        ..selection = TextSelection.fromPosition(TextPosition(
                            offset: coursesController
                                .courseStartDateController.text.length,
                            affinity: TextAffinity.upstream));
                    }
                  },
                ),
                Obx(
                  () => coursesController.isValidDate.value != null
                      ? LabelAndTextfield(
                          text: 'Fecha fin',
                          controller: coursesController.courseEndDateController,
                          validator: (value) {
                            if (value == '')
                              return 'Por favor seleccione una fecha de fin';
                            if (!coursesController.isValidDate.value)
                              return 'No puedes seleccionar una fecha final menor que la inicial';
                          },
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
                              coursesController.validateDates(
                                  startDate, picked);

                              _selectedDate = picked;
                              coursesController.auxEndDate.value =
                                  DateFormat('yyyy-MM-dd')
                                      .format(_selectedDate);
                              coursesController.courseEndDateController
                                ..text = DateFormat('dd/MM/yyyy')
                                    .format(_selectedDate)
                                ..selection = TextSelection.fromPosition(
                                    TextPosition(
                                        offset: coursesController
                                            .courseEndDateController
                                            .text
                                            .length,
                                        affinity: TextAffinity.upstream));
                            }
                          },
                        )
                      : SizedBox.shrink(),
                ),
                LabelAndTextfield(
                  text: 'Fecha entrega',
                  controller: coursesController.courseDeliveryDateController,
                  validator: (value) {
                    if (value == '') {
                      return 'Por favor seleccione una fecha de entrega';
                    }
                  },
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
                      coursesController.auxDeliveryDate.value =
                          DateFormat('yyyy-MM-dd').format(_selectedDate);
                      coursesController.courseDeliveryDateController
                        ..text = DateFormat('dd/MM/yyyy').format(_selectedDate)
                        ..selection = TextSelection.fromPosition(TextPosition(
                            offset: coursesController
                                .courseDeliveryDateController.text.length,
                            affinity: TextAffinity.upstream));
                    }
                  },
                ),
                LabelAndTextfield(
                  text: 'No. Acta',
                  textInputType:
                      TextInputType.numberWithOptions(decimal: false),
                  controller: coursesController.courseActaNumberController,
                  validator: (value) {
                    if (value == '') {
                      return 'Por favor ingrese un número de acta';
                    }
                  },
                ),
                LabelAndTextfield(
                  text: 'No. Horas',
                  controller: coursesController.courseTotalHoursController,
                  textInputType:
                      TextInputType.numberWithOptions(decimal: false),
                  validator: (value) {
                    if (value == '') {
                      return 'Por favor ingrese el número de horas';
                    }
                  },
                ),
                // LabelAndTextfield(
                //   text: 'Tipo/Categoría/Nivel del curso',
                //   controller: coursesController.courseTypeController,
                // ),
                LabelAndDropDown(
                  dynamiList: coursesCategories,
                  hintText: 'Categorías',
                  text: 'Tipo/Categoría/Nivel del curso',
                  dynamicEntity: coursesController.categoryEntity.value,
                  onChanged: (value) {
                    coursesController.categoryEntity(value);
                  },
                ),
                LabelAndTextfield(
                  text: 'Verificado por',
                  controller: coursesController.courseVerifiedByController,
                ),
                SizedBox(
                  height: 8.0,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    CustomButton(
                      backgroundColor: AppColors.red,
                      text: Text(
                        'Guardar',
                        style: TextStyle(color: AppColors.white),
                      ),
                      onPressed: () {
                        _createCourse(context, coursesController);
                      },
                      width: size.width / 4,
                      height: 50,
                    ),
                    SizedBox(
                      width: 10.0,
                    ),
                    CustomButton(
                      backgroundColor: AppColors.red,
                      text: Text(
                        'Cancelar',
                        style: TextStyle(color: AppColors.white),
                      ),
                      onPressed: () {
                        coursesController.isCreateNewCourse.toggle();
                      },
                      width: size.width / 4,
                      height: 50,
                    ),
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  void _createCourse(
      BuildContext context, CoursesController coursesController) async {
    _formKey.currentState.validate();

    if (!_formKey.currentState.validate()) return;

    _formKey.currentState.save();
    print('Printing');
    await coursesController.createCourse(
      id,
      CourseModel(
        id: 0,
        usersId: id,
        courseCategoryId: coursesController.categoryEntity.value.id,
        deliveryDate: coursesController.auxDeliveryDate.value,
        actaNumber: coursesController.courseActaNumberController.text,
        name: coursesController.courseNameController.text,
        startDate: coursesController.auxStartDate.value,
        endDate: coursesController.auxEndDate.value,
        totalHours: coursesController.courseTotalHoursController.text,
        verified: 0,
        verifiedBy: coursesController.courseVerifiedByController.text,
      ),
    );

    if (coursesController.courseCreated.value == 'Ok') {
      print(coursesController.courseCreated.value);
      // Dialogs.alert(_formKey.currentContext,
      //     title: 'Información', description: 'Curso creado con éxito');
      coursesController.clearControllers();
      coursesController.isCreateNewCourse.toggle();
    } else {
      Dialogs.alert(context,
          title: 'Información', description: 'No se pudo crear el curso');
    }
  }
}
