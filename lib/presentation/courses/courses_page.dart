import 'package:cruz_roja/global/theme/theme.dart';
import 'package:cruz_roja/presentation/courses/courses_controller.dart';
import 'package:cruz_roja/presentation/courses/widgets/course_tab.dart';
import 'package:cruz_roja/presentation/home/widgets/drawer.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CoursesPage extends StatefulWidget {
  const CoursesPage({Key key}) : super(key: key);

  @override
  _CoursesPageState createState() => _CoursesPageState();
}

class _CoursesPageState extends State<CoursesPage> {
  final coursesController = Get.put(CoursesController());
  GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: CustomDrawer(),
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
        title: Text('Mis cursos',
            style: Theme.of(context).textTheme.bodyText1.copyWith(
                color: AppColors.appBarText,
                fontSize: 20,
                fontWeight: FontWeight.w600)),
      ),
      body: CourseTab(),
    );
  }
}

// DefaultTabController(
//         length: 2,
//         child: Scaffold(
//           key: _scaffoldKey,
//           drawer: CustomDrawer(),
//           body: NestedScrollView(
//             headerSliverBuilder: (context, innerBoxIsScrolled) {
//               return <Widget>[
//                 new SliverAppBar(
//                   leading: InkWell(
//                     child: Icon(
//                       Icons.menu,
//                       color: Theme.of(context).iconTheme.color,
//                     ),
//                     onTap: () {
//                       _scaffoldKey.currentState.openDrawer();
//                     },
//                   ),
//                   title: Text('Cursos',
//                       style: Theme.of(context).textTheme.bodyText1.copyWith(
//                           color: AppColors.appBarText,
//                           fontSize: 20,
//                           fontWeight: FontWeight.w600)),
//                   pinned: true,
//                   floating: true,
//                   bottom: TabBar(
//                     isScrollable: true,
//                     tabs: [
//                       Tab(
//                         child: Text(
//                           'Inscritos',
//                           style: Theme.of(context).textTheme.bodyText1.copyWith(
//                               color: AppColors.appBarText,
//                               fontSize: 15,
//                               fontWeight: FontWeight.w600),
//                         ),
//                       ),
//                       Tab(
//                         child: Text(
//                           'Disponibles',
//                           style: Theme.of(context).textTheme.bodyText1.copyWith(
//                               color: AppColors.appBarText,
//                               fontSize: 15,
//                               fontWeight: FontWeight.w600),
//                         ),
//                       ),
//                     ],
//                   ),
//                 )
//               ];
//             },
//             body: TabBarView(
//               children: [
//                 CourseTab(title: 'Inscritos', flag: true),
//                 CourseTab(title: 'No inscritos', flag: false),
//               ],
//             ),
//           ),
//         ),
//       ),
