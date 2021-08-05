import 'package:cruz_roja/domain/entities/task_entity.dart';

class TaskModel extends TaskEntity {
  TaskModel(
      {int id,
      String name,
      String description,
      int volunteersQuantity,
      String date,
      String hour,
      int hoursQuantity,
      String city,
      String department,
      String address,
      int category,
      int status,
      int isAdult,
      int coordinator,
      String createdOn})
      : super(
            id: id,
            name: name,
            description: description,
            volunteersQuantity: volunteersQuantity,
            date: date,
            hour: hour,
            hoursQuantity: hoursQuantity,
            city: city,
            department: department,
            address: address,
            category: category,
            status: status,
            isAdult: isAdult,
            coordinator: coordinator,
            createdOn: createdOn);

  factory TaskModel.fromJson(Map<String, dynamic> json) => TaskModel(
        id: json["id_actividad"],
        name: json["nombre"],
        description: json["descripcion"],
        volunteersQuantity: json["cantidad_voluntarios"],
        date: json["fecha"],
        hour: json["hora"],
        hoursQuantity: json["cantidad_horas"],
        city: json["ciudad"],
        department: json["departamento"],
        address: json["direccion"],
        category: json["id_categoria"],
        coordinator: json["id_cordinador"],
        status: json["status"],
        isAdult: json["mayor_edad"],
        createdOn: json["created_on"],
      );

  Map<String, dynamic> toJson() => {
        "id_actividad": id,
        "name": name,
        "descripcion": description,
        "cantidad_voluntarios": volunteersQuantity,
        "fecha": date,
        "hora": date,
        "cantidad_horas": hoursQuantity,
        "ciudad": city,
        "departamento": department,
        "direccion": address,
        "id_categoria": category,
        "id_cordinador": coordinator,
        "created_on": createdOn,
        "status": status,
        "mayor_edad": isAdult
      };
}
