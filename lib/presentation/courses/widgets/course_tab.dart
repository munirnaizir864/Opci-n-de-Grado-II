import 'package:cruz_roja/data/models/course_model.dart';
import 'package:cruz_roja/domain/entities/course_entity.dart';
import 'package:cruz_roja/global/theme/theme.dart';
import 'package:cruz_roja/global/utils.dart';
import 'package:cruz_roja/presentation/auth/login/login_controller.dart';
import 'package:cruz_roja/presentation/auth/widgets/custom_button.dart';
import 'package:cruz_roja/presentation/courses/courses_controller.dart';
import 'package:cruz_roja/presentation/courses/widgets/new_course.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';

class CourseTab extends StatelessWidget {
  final String title;
  //final bool flag;

  CourseTab({
    Key key,
    this.title,
  }) : super(key: key);

  int id = Get.find<LoginController>().userId.value;

  final coursesController = Get.find<CoursesController>();

  @override
  Widget build(BuildContext context) {
    coursesController.loadCourses();
    return Scaffold(body: _createBody(context, coursesController));
  }

  Widget _createBody(
      BuildContext context, CoursesController coursesController) {
    final size = MediaQuery.of(context).size;
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 10.0),
        child: Column(
          children: [
            Obx(
              () => coursesController.isCreateNewCourse.value
                  ? CreateNewCourse()
                  : _buildCoursesList(coursesController.coursesByUser, context,
                      coursesController),
            ),
            SizedBox(
              height: 10.0,
            ),
            Obx(
              () => Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Visibility(
                    visible: !coursesController.isCreateNewCourse.value,
                    child: CustomButton(
                      backgroundColor: AppColors.red,
                      text: Text(
                        'Crea un nuevo curso',
                        style: TextStyle(color: AppColors.white),
                      ),
                      onPressed: () {
                        coursesController.isCreateNewCourse.toggle();
                      },
                      width: size.width / 2,
                      height: 50,
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget _buildCoursesList(List<CourseEntity> courses, BuildContext context,
      CoursesController coursesController) {
    return Obx(
      () => coursesController.coursesByUser.isNotEmpty
          ? Column(
              children: [
                Text(
                  '( ${coursesController.coursesByUser.length} )  Cursos',
                  style: TextStyle(
                    color: AppColors.red,
                    fontWeight: FontWeight.bold,
                    fontSize: 15.0.sp,
                  ),
                ),
                Container(
                  height: 70.0.h,
                  child: ListView.builder(
                    itemCount: coursesController.coursesByUser.length,
                    itemBuilder: (context, index) {
                      return _createTile(
                        coursesController.coursesByUser[index],
                      );
                    },
                    shrinkWrap: true,
                    physics: BouncingScrollPhysics(),
                    padding: EdgeInsets.symmetric(horizontal: 15.0),
                  ),
                ),
              ],
            )
          : Center(
              child: Text('No tienes cursos creados...'),
            ),
    );
  }

  Widget _createTile(CourseEntity c) {
    final startD = dateFormat(c.startDate);
    final endD = dateFormat(c.endDate);
    return GestureDetector(
      child: Card(
        child: Row(
          children: <Widget>[
            Expanded(
              flex: 3,
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 15.0, vertical: 8.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      c.name,
                      style: TextStyle(
                          fontSize: 15.0.sp,
                          fontWeight: FontWeight.bold,
                          color: AppColors.iconColor),
                    ),

                    //     ? Text('')

                    Text(
                      'No Acta: ${c.actaNumber}',
                      // _itemSelected.contains('filtro') ? '' : _itemSelected,
                      style: TextStyle(fontSize: 11.0.sp),
                    ),
                    Text(
                      'Fecha Inicio: $startD',
                      // _itemSelected.contains('filtro') ? '' : _itemSelected,
                      style: TextStyle(fontSize: 11.0.sp),
                    ),
                    Text(
                      'Fecha Fin: $endD',
                      // _itemSelected.contains('filtro') ? '' : _itemSelected,
                      style: TextStyle(fontSize: 11.0.sp),
                    ),
                    Text(
                      'Horas totales: ${c.totalHours}',
                      // _itemSelected.contains('filtro') ? '' : _itemSelected,
                      style: TextStyle(fontSize: 11.0.sp),
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
      onTap: () {},
    );
  }
}
