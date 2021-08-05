import 'package:cruz_roja/domain/entities/task_entity.dart';
import 'package:cruz_roja/global/dynamic_lists.dart';
import 'package:cruz_roja/global/theme/theme.dart';
import 'package:cruz_roja/presentation/home/widgets/drawer.dart';
import 'package:cruz_roja/presentation/home/widgets/task.dart';
import 'package:cruz_roja/presentation/tasks/my_tasks_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MyTasksPage extends StatelessWidget {
  bool isExpanded = false;
  @override
  Widget build(BuildContext context) {
    GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
    final controller = Get.put(MyTasksController());
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
        title: Text('Actividades',
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
              'Mis actividades',
              style: Theme.of(context).textTheme.bodyText1.copyWith(
                    color: AppColors.appBarText,
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                  ),
              textAlign: TextAlign.left,
            ),
            Expanded(
              child: Obx(() {
                return controller.myTasks.isEmpty
                    ? Center(child: Text('No tienes actividades en curso...'))
                    : ListView.builder(
                        //shrinkWrap: true,
                        itemCount: controller.myTasks.length,
                        itemBuilder: (context, index) {
                          TaskEntity task = controller.myTasks[index];
                          return TaskElement(
                            task: task,
                            isCompletedOrActive: true,
                            onTap: () async {
                              controller.markTaskAsDone(task);
                            },
                          );
                        },
                      );
              }),
            ),
            const SizedBox(
              height: 8.0,
            ),
            Text(
              'Actividades finalizadas',
              style: Theme.of(context).textTheme.bodyText1.copyWith(
                    color: AppColors.appBarText,
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                  ),
              textAlign: TextAlign.left,
            ),
            Expanded(
              child: Obx(
                () => controller.completedTasks.isNotEmpty
                    ? ListView.builder(
                        //shrinkWrap: true,
                        itemCount: controller.completedTasks.length,
                        itemBuilder: (context, index) {
                          TaskEntity task = controller.completedTasks[index];
                          return TaskElement(
                            task: task,
                            isCompletedOrActive: true,
                            onTap: () {},
                          );
                        },
                      )
                    : Center(
                        child: Text('No tienes actividades completadas...')),
              ),
            )
          ],
        ),
      ),
      drawer: CustomDrawer(),
    );
  }
}
