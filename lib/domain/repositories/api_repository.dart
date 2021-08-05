import 'dart:io';

import 'package:cruz_roja/data/models/course_model.dart';
import 'package:cruz_roja/data/models/user_model.dart';
import 'package:cruz_roja/domain/entities/course_entity.dart';
import 'package:cruz_roja/domain/entities/task_entity.dart';

import '../entities/login_request.dart';
import '../entities/login_response.dart';
import '../entities/user_entity.dart';

abstract class ApiRepository {
  Future<UserEntity> getUserFromId(int userId);

  Future<LoginResponse> login(LoginRequest login);

  Future<void> logout(String token);

  Future<List<TaskEntity>> getUserTasks(int userId);
  Future<List<TaskEntity>> getAvailableTasks(int userId);
  Future<List<TaskEntity>> getCompletedTasks(int userId);
  Future<bool> acceptTask(int userId, int activityId);

  Future<bool> updateUser(UserModel user);

  Future<List<CourseEntity>> getCoursesByUser(int userId);

  Future<String> createCourse(int userId, CourseModel course);
  Future<Map<String, dynamic>> uploadPassport(
      File file, String documentNumber, String type);
}
