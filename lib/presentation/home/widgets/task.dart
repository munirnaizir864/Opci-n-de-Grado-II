import 'package:cruz_roja/domain/entities/task_entity.dart';
import 'package:cruz_roja/global/theme/theme.dart';
import 'package:cruz_roja/global/utils.dart';
import 'package:cruz_roja/presentation/auth/widgets/custom_button.dart';
import 'package:cruz_roja/presentation/home/home_controller.dart';
import 'package:expandable/expandable.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

// class TaskWidget extends StatelessWidget {
//   final TaskEntity task;
//   final ValueChanged<bool> onChanged;
//   bool isExpanded;
//   bool isDone;
//   final VoidCallback ontap;
//   TaskWidget(
//       {Key key,
//       this.task,
//       this.isExpanded = false,
//       this.isDone = false,
//       this.onChanged,
//       this.ontap})
//       : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     final size = MediaQuery.of(context).size;
//     return Container(
//       padding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 8.0),
//       margin: const EdgeInsets.only(top: 10.0),
//       decoration: BoxDecoration(
//           color: AppColors.white,
//           border: Border.all(
//             color: AppColors.bordercolor,
//           ),
//           borderRadius: BorderRadius.circular(10.0)),
//       child: Column(
//         crossAxisAlignment: CrossAxisAlignment.stretch,
//         children: [
//           Text(
//             task.name,
//             style: Theme.of(context).textTheme.bodyText1.copyWith(
//                   color: AppColors.defaultColor,
//                   fontSize: 15,
//                 ),
//           ),
//           isExpanded
//               ? Column(
//                   crossAxisAlignment: CrossAxisAlignment.start,
//                   children: [
//                     Text(task.description,
//                         style: Theme.of(context).textTheme.bodyText1),
//                     Text('Fecha : ${task.date}'),
//                     Text('City : ${task.city}'),
//                     Text('Departamento : ${task.department}'),
//                     Text('Horas : ${task.hoursQuantity}'),
//                     CustomButton(
//                       text: Text(
//                         'Finalizar',
//                         style: Theme.of(context).textTheme.bodyText1,
//                       ),
//                       backgroundColor: AppColors.blue,
//                       onPressed: ontap,
//                     )
//                   ],
//                 )
//               : SizedBox.shrink(),
//           Align(
//             alignment: Alignment.centerLeft,
//             child: CustomButton(
//               text: Text(
//                 isExpanded ? 'Ocultar' : 'Ver detalles',
//                 style: Theme.of(context).textTheme.bodyText1.copyWith(
//                       color: AppColors.white,
//                     ),
//                 textAlign: TextAlign.center,
//               ),
//               height: 40,
//               width: size.width / 4,
//               backgroundColor: AppColors.red,
//               onPressed: () {},
//             ),
//           )
//         ],
//       ),
//     );
//   }
// }

//class TaskElement extends StatelessWidget {
//   final TaskEntity task;
//   final VoidCallback onPressed;
//   const TaskElement({Key key, this.task, this.onPressed}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     final size = MediaQuery.of(context).size;
//     return Container(
//       padding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 8.0),
//       margin: const EdgeInsets.only(top: 10.0),
//       decoration: BoxDecoration(
//           color: AppColors.white,
//           border: Border.all(
//             color: AppColors.bordercolor,
//           ),
//           borderRadius: BorderRadius.circular(10.0)),
//       child: Column(
//         crossAxisAlignment: CrossAxisAlignment.stretch,
//         children: [
//           Text(
//             task.name,
//             style: Theme.of(context).textTheme.bodyText1.copyWith(
//                   color: AppColors.defaultColor,
//                   fontSize: 15,
//                 ),
//           ),
//           Align(
//             alignment: Alignment.centerLeft,
//             child: CustomButton(
//               text: Text(
//                 'Ver detalles',
//                 style: Theme.of(context).textTheme.bodyText1.copyWith(
//                       color: AppColors.white,
//                     ),
//               ),
//               height: 40,
//               width: size.width / 4,
//               backgroundColor: AppColors.red,
//               onPressed: onPressed,
//             ),
//           )
//         ],
//       ),
//     );
//   }
// }

class TaskElement extends StatelessWidget {
  final TaskEntity task;
  final bool isCompletedOrActive;
  final VoidCallback onTap;

  const TaskElement({Key key, this.task, this.onTap, this.isCompletedOrActive})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    buildCollapsed1(TaskEntity task) {
      return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Padding(
              padding: EdgeInsets.all(10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Row(
                    children: [
                      Text(
                        task.name,
                        style: Theme.of(context)
                            .textTheme
                            .bodyText1
                            .copyWith(fontWeight: FontWeight.bold),
                      ),
                      const SizedBox(
                        width: 10.0,
                      ),
                      if (task.status == 0)
                        Text(
                          "Cancelada ",
                          style: Theme.of(context).textTheme.bodyText1.copyWith(
                              fontWeight: FontWeight.bold,
                              color: AppColors.red),
                        )
                    ],
                  ),
                ],
              ),
            ),
          ]);
    }

    buildExpanded1(TaskEntity task) {
      final date = dateFormat(task.date);
      //final hour = startEndHour2(task.hour);
      final isAdult = task.isAdult == 1 ? 'Si' : 'No';
      return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Padding(
              padding: EdgeInsets.all(10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: <Widget>[
                  Row(
                    children: [
                      Text(
                        "${task.name} ",
                        style: Theme.of(context)
                            .textTheme
                            .bodyText1
                            .copyWith(fontWeight: FontWeight.bold),
                      ),
                      const SizedBox(
                        width: 10.0,
                      ),
                      if (task.status == 0)
                        Text(
                          "Cancelada ",
                          style: Theme.of(context).textTheme.bodyText1.copyWith(
                              fontWeight: FontWeight.bold,
                              color: AppColors.red),
                        )
                    ],
                  ),
                  Text('Descripción: ${task.description}',
                      style: Theme.of(context).textTheme.bodyText1),
                  Text('Fecha: $date'),
                  Text('Hora: ${task.hour}'),
                  Text('Ciudad: ${task.city}'),
                  Text('Departamento: ${task.department}'),
                  Text('Horas: ${task.hoursQuantity}'),
                  Text('Mayor de edad: $isAdult'),
                  Text(
                      'Cantidad de voluntarios: ${task.volunteersQuantity.toString()}'),
                  isCompletedOrActive
                      ? SizedBox.shrink()
                      : CustomButton(
                          height: 35,
                          width: 100,
                          text: Text(
                            'Inscribirme',
                            style: Theme.of(context)
                                .textTheme
                                .bodyText1
                                .copyWith(color: AppColors.white),
                          ),
                          backgroundColor: AppColors.blue,
                          borderColor: AppColors.blue,
                          onPressed: onTap,
                        )
                ],
              ),
            ),
          ]);
    }

    return ExpandableNotifier(
        child: Padding(
      padding: const EdgeInsets.only(left: 10, right: 10, bottom: 10),
      child: ScrollOnExpand(
        child: Card(
          clipBehavior: Clip.antiAlias,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Expandable(
                collapsed: buildCollapsed1(task),
                expanded: buildExpanded1(task),
              ),
              // Expandable(
              //   collapsed: buildCollapsed2(),
              //   expanded: buildExpanded2(),
              // ),
              // Expandable(
              //   collapsed: buildCollapsed3(),
              //   expanded: buildExpanded3(),
              // ),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: <Widget>[
                  Builder(
                    builder: (context) {
                      var controller = ExpandableController.of(
                        context,
                      );
                      return Padding(
                        padding: EdgeInsets.fromLTRB(5.0, 0, 5.0, 5.0),
                        child: CustomButton(
                          height: 35,
                          width: size.width / 4,
                          backgroundColor: AppColors.red,
                          text: Text(
                            controller.expanded ? "Ocultar" : "Ver detalles",
                            style: Theme.of(context)
                                .textTheme
                                .button
                                .copyWith(color: AppColors.white),
                          ),
                          onPressed: () {
                            controller.toggle();
                          },
                        ),
                      );
                    },
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    ));
  }
}
