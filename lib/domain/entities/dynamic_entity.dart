import 'package:equatable/equatable.dart';

class DynamicEntity extends Equatable {
  String name;
  int id;

  DynamicEntity({this.name, this.id});

  factory DynamicEntity.empty() => DynamicEntity(name: null, id: null);

  @override
  List<Object> get props => [name, id];
}
