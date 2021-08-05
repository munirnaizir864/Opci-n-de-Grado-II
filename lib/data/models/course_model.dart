import 'package:cruz_roja/domain/entities/course_entity.dart';

class CourseModel extends CourseEntity {
  CourseModel({
    int id,
    int usersId,
    String name,
    String startDate,
    String endDate,
    String actaNumber,
    String deliveryDate,
    int courseCategoryId,
    String totalHours,
    int verified,
    String verifiedBy,
  }) : super(
          id: id,
          usersId: usersId,
          name: name,
          startDate: startDate,
          endDate: endDate,
          actaNumber: actaNumber,
          deliveryDate: deliveryDate,
          courseCategoryId: courseCategoryId,
          totalHours: totalHours,
          verified: verified,
          verifiedBy: verifiedBy,
        );

  factory CourseModel.fromJson(Map<String, dynamic> json) => CourseModel(
        id: json["id_curso"],
        usersId: json["id_usuarios"],
        name: json["nombre"],
        startDate: json["fecha_inicio"],
        endDate: json["fecha_fin"],
        actaNumber: json["no_acta"],
        deliveryDate: json["fecha_entrega"],
        courseCategoryId: json["id_categoria_curso"],
        totalHours: json["total_hora"],
        verified: json["verificado"],
        verifiedBy: json["verificado_por"],
      );

  Map<String, dynamic> toJson() => {
        "id_curso": id,
        "id_usuarios": usersId,
        "nombre": name,
        "fecha_Inicio": startDate,
        "fecha_fin": endDate,
        "no_acta": actaNumber,
        "fecha_entrega": deliveryDate,
        "id_categoria_curso": courseCategoryId,
        "total_hora": totalHours,
        "verificado": verified,
        "verificado_por": verifiedBy,
      };
}
