import 'package:equatable/equatable.dart';

class TaskEntity extends Equatable {
  final int id;
  final String name;
  final String description;
  final int volunteersQuantity;
  final String date;
  final String hour;
  final int hoursQuantity;
  final String city;
  final String department;
  final String address;
  final int category;
  final int status;
  final int isAdult;
  final int coordinator;
  final String createdOn;

  TaskEntity({
    this.id,
    this.volunteersQuantity,
    this.date,
    this.hoursQuantity,
    this.city,
    this.department,
    this.address,
    this.category,
    this.name,
    this.description,
    this.hour,
    this.status,
    this.isAdult,
    this.coordinator,
    this.createdOn,
  });

  factory TaskEntity.empty() => TaskEntity(
        name: null,
        description: null,
        volunteersQuantity: null,
        date: null,
        hour: null,
        hoursQuantity: null,
        city: null,
        department: null,
        address: null,
        category: null,
        status: null,
        isAdult: null,
        coordinator: null,
        createdOn: null,
      );

  @override
  List<Object> get props => [
        name,
        description,
        volunteersQuantity,
        date,
        hour,
        city,
        department,
        address,
        category,
        status,
        isAdult,
        coordinator,
        createdOn
      ];
}
