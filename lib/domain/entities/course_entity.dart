import 'package:equatable/equatable.dart';

class CourseEntity extends Equatable {
  final int id;
  final int usersId;
  final String name;
  final String startDate;
  final String endDate;
  final String actaNumber;
  final String deliveryDate;
  final int courseCategoryId;
  final String totalHours;
  final int verified;
  final String verifiedBy;
  CourseEntity({
    this.usersId,
    this.id,
    this.name,
    this.startDate,
    this.endDate,
    this.actaNumber,
    this.deliveryDate,
    this.courseCategoryId,
    this.totalHours,
    this.verified,
    this.verifiedBy,
  });

  factory CourseEntity.empty() => CourseEntity(
        usersId: null,
        id: null,
        name: null,
        startDate: null,
        endDate: null,
        actaNumber: null,
        deliveryDate: null,
        courseCategoryId: null,
        totalHours: null,
        verified: null,
        verifiedBy: null,
      );

  @override
  List<Object> get props => [
        usersId,
        id,
        name,
        startDate,
        endDate,
        actaNumber,
        deliveryDate,
        courseCategoryId,
        totalHours,
        verified,
        verifiedBy,
      ];
}
