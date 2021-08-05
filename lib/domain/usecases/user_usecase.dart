import 'dart:io';

import 'package:cruz_roja/data/models/course_model.dart';
import 'package:cruz_roja/domain/entities/course_entity.dart';
import 'package:cruz_roja/domain/entities/task_entity.dart';
import 'package:cruz_roja/domain/repositories/api_repository.dart';

import '../entities/user_entity.dart';
import '../repositories/local_storage_repository.dart';

class UserUseCases {
  final LocalStorageRepository localStorageRepository;
  final ApiRepository apiRepository;

  UserUseCases({this.apiRepository, this.localStorageRepository});

  Future<void> clearAllData() async {
    return await localStorageRepository.clearAllData();
  }

  Future<String> getToken() async {
    return await localStorageRepository.getToken();
  }

  Future<String> saveToken(String token) async {
    return await localStorageRepository.saveToken(token);
  }

  Future<UserEntity> getUser() async {
    return await localStorageRepository.getUser();
  }

  Future<UserEntity> saveUser(UserEntity user) async {
    return await localStorageRepository.saveUser(user);
  }

  Future<List<TaskEntity>> getUserTasks(int userId) async {
    return await apiRepository.getUserTasks(userId);
  }

  Future<List<TaskEntity>> getAvailableTasks(int userId) async {
    return await apiRepository.getAvailableTasks(userId);
  }

  Future<List<TaskEntity>> getCompletedTasks(int userId) async {
    return await apiRepository.getCompletedTasks(userId);
  }

  Future<bool> acceptTask(int userId, int activityId) async {
    return await apiRepository.acceptTask(userId, activityId);
  }

  Future<bool> updateUser(UserEntity user) async {
    return await apiRepository.updateUser(user);
  }

  Future<String> createCourse(int userId, CourseModel course) async {
    return await apiRepository.createCourse(userId, course);
  }

  Future<List<CourseEntity>> getCoursesByUser(int userId) async {
    return await apiRepository.getCoursesByUser(userId);
  }

  Future<Map<String, dynamic>> uploadPassport(
      File file, String documentNumber, String type) async {
    return await apiRepository.uploadPassport(file, documentNumber, type);
  }
  // Future<bool> isDarkTheme( ) async {
  //   return await localStorageRepository.isDarkTheme();
  // }

  // Future<void> saveDarkTheme(bool darkTheme ) async {
  //   return await localStorageRepository.saveDarkTheme(darkTheme);
  // }

}
