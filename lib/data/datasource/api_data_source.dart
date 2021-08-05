import 'dart:convert';
import 'dart:io';

import 'package:cruz_roja/data/models/course_model.dart';
import 'package:cruz_roja/data/models/task_model.dart';
import 'package:cruz_roja/domain/entities/course_entity.dart';
import 'package:cruz_roja/domain/entities/task_entity.dart';
import 'package:cruz_roja/global/dynamic_lists.dart';
import 'package:get/get.dart';
import 'package:path/path.dart';
import '../../domain/entities/login_request.dart';
import '../../domain/entities/login_response.dart';
import '../../domain/entities/user_entity.dart';
import '../models/user_model.dart';
import 'package:http/http.dart' as http;

abstract class ApiDataSource {
  Future<UserEntity> getUserFromId(int userId);

  Future<LoginResponse> login(LoginRequest login);

  Future<void> logout(String token);

  Future<List<TaskEntity>> getUserTasks(int userId);
  Future<List<TaskEntity>> getAvailableTasks(int userId);
  Future<List<TaskEntity>> getCompletedTasks(int userId);
  Future<bool> acceptTask(int userId, int activityId);

  Future<List<CourseEntity>> getCoursesByUser(int userId);

  Future<String> createCourse(int userId, CourseModel course);

  Future<bool> updateUser(UserModel user);

  Future<Map<String, dynamic>> uploadPassport(
      File file, String documentNumber, String type);
}

class ApiDataSourceImpl implements ApiDataSource {
  final _api = 'https://ogdel43d96.execute-api.us-east-1.amazonaws.com/prod/';
  final _api2 =
      'https://wo7z14x5gg.execute-api.us-east-1.amazonaws.com/prod/upload';

  @override
  Future<UserModel> getUserFromId(int userId) async {
    //String token
    String url = '$_api/user/$userId';

    final resp = await http.get(url);

    final decodedData = json.decode(resp.body);

    UserModel user = UserModel.fromJson(decodedData[0]);
    return user;
    // await Future.delayed(Duration(seconds: 3));
    // if (token == 'AA111') {
    //   return UserModel(
    //     name: 'Mugiwara D. Luffy',
    //     surname: 'luffy',
    //   );
    // } else if (token == 'AA222') {
    //   return UserModel(
    //     name: 'Roronoa Zoro',
    //     surname: 'zoro',
    //   );
    // }
    // throw Exception('error');
  }

  @override
  Future<LoginResponse> login(LoginRequest login) async {
    String url = '$_api/login';

    final _header = <String, String>{
      'Content-Type': 'application/json',
    };

    final _body = json.encode({"email": login.email, "pass": login.password});

    final resp = await http.post(url, body: _body, headers: _header);

    final decodedData = json.decode(resp.body);

    return LoginResponse(decodedData["id_usuarios"], decodedData["ok"]);
    //   await Future.delayed(Duration(seconds: 3));
    //   if (login.username == 'luffy' && login.pasword == 'luffy') {
    //     return LoginResponse(
    //         'AA111',
    //         UserModel(
    //           name: 'Mugiwara D. Luffy',
    //           surname: 'luffy',
    //         ));
    //   } else if (login.username == 'zoro' && login.pasword == 'zoro') {
    //     return LoginResponse(
    //         'AA222',
    //         UserModel(
    //           name: 'Roronoa Zoro',
    //           surname: 'zoro',
    //         ));
    //   }
    //   throw Exception('error');
  }

  @override
  Future<void> logout(String token) async {
    print('removing token from server');
    return;
  }

  @override
  Future<List<TaskEntity>> getUserTasks(int userId) async {
    String url = '$_api/actividadAcetadas/$userId';
    List<TaskModel> _activities = <TaskModel>[];
    final resp = await http.get(url);

    final decodedData = json.decode(resp.body);
    if (decodedData['ok'] == true)
      for (var item in decodedData['results']) {
        _activities.add(TaskModel.fromJson(item));
      }
    return _activities;
  }

  @override
  Future<List<TaskModel>> getAvailableTasks(int userId) async {
    String url = '$_api/actividad/$userId';
    List<TaskModel> _activities = <TaskModel>[];
    final resp = await http.get(url);

    final decodedData = json.decode(resp.body);
    if (decodedData['ok'] == true)
      for (var item in decodedData['results']) {
        _activities.add(TaskModel.fromJson(item));
      }
    return _activities;
    // await Future.delayed(Duration(seconds: 1));
    // return myTaskList;
  }

  @override
  Future<List<TaskEntity>> getCompletedTasks(int userId) async {
    String url = '$_api/actividadvencida/$userId';
    List<TaskModel> _activities = <TaskModel>[];
    final resp = await http.get(url);

    final decodedData = json.decode(resp.body);
    if (decodedData['ok'] == true)
      for (var item in decodedData['results']) {
        _activities.add(TaskModel.fromJson(item));
      }
    return _activities;
  }

  Future<bool> acceptTask(int userId, int activityId) async {
    String url = '$_api/aceptarActividad';
    final _header = <String, String>{
      'Content-Type': 'application/json',
    };
    final _body =
        json.encode({"id_usuarios": userId, "id_actividad": activityId});

    final resp = await http.post(url, headers: _header, body: _body);
    final decodedData = json.decode(resp.body);
    if (decodedData['ok'] == true) {
      return true;
    } else {
      return false;
    }
  }

  @override
  Future<List<CourseModel>> getCoursesByUser(int userId) async {
    String url = '$_api/cursosByUser/$userId';
    List<CourseModel> _courses = <CourseModel>[];

    final resp = await http.get(url);

    final decodedData = json.decode(resp.body);
    if (decodedData['ok'] == true)
      for (var item in decodedData['rows']) {
        _courses.add(CourseModel.fromJson(item));
      }
    return _courses;
  }

  @override
  Future<bool> updateUser(UserModel user) async {
    String url = '$_api/user';
    final _header = <String, String>{
      'Content-Type': 'application/json',
    };
    final _body = json.encode(user.toJson());

    final resp = await http.post(url, headers: _header, body: _body);

    final decodedData = json.decode(resp.body);
    print(resp.body);
    if (resp.statusCode == 200) {
      return true;
    } else
      return false;
  }

  @override
  Future<String> createCourse(int userId, CourseModel course) async {
    String url = '$_api/cursos';
    final _header = <String, String>{
      'Content-Type': 'application/json',
    };
    final _body = json.encode(course.toJson());

    final resp = await http.post(url, headers: _header, body: _body);
    //final decodedData = json.decode(resp.body);
    if (resp.statusCode == 200) {
      return 'Ok';
    } else {
      return 'Not ok';
    }
  }

  @override
  Future<Map<String, dynamic>> uploadPassport(
      File file, String documentNumber, String type) async {
    var stream = new http.ByteStream(file.openRead());
    stream.cast();

    // Get file length
    var length = await file.length();

    final _header = <String, String>{
      'Content-Type': 'application/json',
    };

    var uri = Uri.parse(_api2);

    var request = http.MultipartRequest("POST", uri);
    // http.MultipartFile multipartFileSign =
    //     await http.MultipartFile.fromPath('photo', image.path);
    //final mimeType = mime(image.path).split('/'); //image/jpeg

    // final multipartFileSign = await http.MultipartFile.fromPath(
    //     'photo', image.path,
    //     contentType: MediaType(mimeType[0], mimeType[1]));

    var multipartFileSign = http.MultipartFile('file', stream, length,
        filename: basename(file.path));

    request.files.add(multipartFileSign);

    request.headers.addAll(_header);
    request.fields['Metadata'] =
        json.encode({'usuario': documentNumber, "type": type});
    //request.fields['type'] = 'pasaporte';

    var response = await request.send();
    final resp = await http.Response.fromStream(response);
    print(response.statusCode);
    print(resp.body);
    if (resp.statusCode == 200) {
      return {'ok': true};
    } else {
      return {'ok': false};
    }
  }
}

// class ApiService {
//   // this should be in the extra file
//   Future<List<UserModel>> getAllUsers() async {
//     final url = 'api/users/'; // API URL

//     final response = http.get(url);
//     var data = json.decode(response.body);

//     //create a list of users
//     List<UserModel> usersList = <UserModel>[];

//     for (var item in data) {
//       //data may vary depending on your body response
//       //could be data[0] if your response is a list
//       usersList.add(UserModel.fromJson(item));
//     }

//     return usersList;
//   }
// }

// class HomeController extends GetxController {
//   final ApiService apiService;

//   HomeController(this.apiService);

//   RxList<UserModel> users = <UserModel>[].obs;

//   void getUsers() async {
//     final usuarios = await apiService.getAllUsers();
//     users.assignAll(usuarios);
//   }
// }
