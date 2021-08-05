import 'package:cruz_roja/domain/entities/task_entity.dart';
import 'package:cruz_roja/global/dynamic_lists.dart';
import 'package:cruz_roja/global/theme/theme.dart';
import 'package:cruz_roja/global/utils.dart';
import 'package:cruz_roja/presentation/auth/login/login_controller.dart';
import 'package:cruz_roja/presentation/home/home_controller.dart';
import 'package:cruz_roja/presentation/home/widgets/drawer.dart';
import 'package:cruz_roja/presentation/home/widgets/task.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

class HomePage extends StatelessWidget {
  //final tasksController = Get.find<MyTasksController>();
  final controller = Get.find<HomeController>();
  int id = Get.find<LoginController>().userId.value;
  @override
  Widget build(BuildContext context) {
    print('build');
    GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
    return Scaffold(
      key: _scaffoldKey,
      appBar: AppBar(
        titleSpacing: 0.0,
        leading: InkWell(
          child: Icon(
            Icons.menu,
            color: Theme.of(context).iconTheme.color,
          ),
          onTap: () {
            _scaffoldKey.currentState.openDrawer();
          },
        ),
        title: Text('Inicio',
            style: Theme.of(context).textTheme.bodyText1.copyWith(
                color: AppColors.appBarText,
                fontSize: 20,
                fontWeight: FontWeight.w600)),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 23.0, vertical: 15.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(
              'Actividades sugeridas',
              style: Theme.of(context).textTheme.bodyText1.copyWith(
                    color: AppColors.appBarText,
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                  ),
              textAlign: TextAlign.left,
            ),
            Expanded(
              child: Obx(
                () => controller.tasks.length > 0
                    ? ListView.builder(
                        //shrinkWrap: true,
                        itemCount: controller.tasks.length,
                        itemBuilder: (context, index) {
                          TaskEntity task = controller.tasks[index];
                          //bool isExpanded = control[index];
                          final isCompletedOrActive =
                              task.status == 0 || task.status == 2
                                  ? true
                                  : false;
                          return TaskElement(
                            task: task,
                            isCompletedOrActive: isCompletedOrActive,
                            onTap: () {
                              controller.user.value.status == 0
                                  ? controller.acceptTask(id, task.id)
                                  : Dialogs.alert2(context, () {
                                      //controller.update();
                                      Navigator.of(context).pop();
                                    },
                                      title: 'Perfil inactivo',
                                      description:
                                          'Por favor sube una solicitud de reactivación para poder inscribir actividades');
                            },
                          );
                        },
                      )
                    : Text('No hay actividades disponibles'),
              ),
            )
          ],
        ),
      ),
      drawer: CustomDrawer(),
    );
  }
}
