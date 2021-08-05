import 'dart:io';

import 'package:cruz_roja/data/models/course_model.dart';
import 'package:cruz_roja/data/models/user_model.dart';
import 'package:cruz_roja/domain/entities/course_entity.dart';
import 'package:cruz_roja/domain/entities/task_entity.dart';

import '../../domain/entities/login_request.dart';
import '../../domain/entities/login_response.dart';
import '../../domain/entities/user_entity.dart';
import '../../domain/repositories/api_repository.dart';
import '../datasource/api_data_source.dart';

class ApiRepositoryImpl implements ApiRepository {
  final ApiDataSource apiDataSource;

  ApiRepositoryImpl({this.apiDataSource});

  @override
  Future<UserEntity> getUserFromId(int userId) async {
    return await apiDataSource.getUserFromId(userId);
  }

  @override
  Future<LoginResponse> login(LoginRequest login) async {
    return await apiDataSource.login(login);
  }

  @override
  Future<void> logout(String token) async {
    return await apiDataSource.logout(token);
  }

  @override
  Future<List<TaskEntity>> getUserTasks(int userId) async {
    return await apiDataSource.getUserTasks(userId);
  }

  @override
  Future<List<TaskEntity>> getAvailableTasks(int userId) async {
    return await apiDataSource.getAvailableTasks(userId);
  }

  @override
  Future<List<TaskEntity>> getCompletedTasks(int userId) async {
    return await apiDataSource.getCompletedTasks(userId);
  }

  @override
  Future<bool> acceptTask(int userId, int activityId) async {
    return await apiDataSource.acceptTask(userId, activityId);
  }

  @override
  Future<bool> updateUser(UserModel user) async {
    return await apiDataSource.updateUser(user);
  }

  @override
  Future<String> createCourse(int userId, CourseModel course) async {
    return await apiDataSource.createCourse(userId, course);
  }

  @override
  Future<List<CourseEntity>> getCoursesByUser(int userId) async {
    return await apiDataSource.getCoursesByUser(userId);
  }

  @override
  Future<Map<String, dynamic>> uploadPassport(
      File file, String documentNumber, String type) async {
    return await apiDataSource.uploadPassport(file, documentNumber, type);
  }
}
