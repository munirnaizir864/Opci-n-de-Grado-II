import 'package:cruz_roja/domain/entities/login_request.dart';
import 'package:cruz_roja/domain/usecases/auth_usecase.dart';
import 'package:cruz_roja/domain/usecases/user_usecase.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

enum LoginState { initial, loading }

class LoginController extends GetxController {
  final UserUseCases userUseCases;
  final AuthUseCase loginUseCase;

  LoginController({this.userUseCases, this.loginUseCase});

  final usernameTextController = TextEditingController();
  final passwordTextController = TextEditingController();

  var loginState = LoginState.initial.obs;

  RxInt userId = 0.obs;

  // @override
  // void onInit() {

  //   super.onInit();
  // }

  // Future<bool> login() async {
  //   final username = usernameTextController.text;
  //   final password = passwordTextController.text;
  //   loginState(LoginState.loading);
  //   try {
  //     final loginResponse =
  //         await loginUseCase.login(LoginRequest(username, password));
  //     await userUseCases.saveToken(loginResponse.token);
  //     await userUseCases.saveUser(loginResponse.user);

  //     return true;
  //   } catch (e) {
  //     print(e);
  //     loginState(LoginState.initial);
  //     return false;
  //   }
  // }
  Future<bool> login() async {
    final username =
        'milenis@cruzrojaatlantico.org'; //usernameTextController.text;
    final password = 'milenis'; //passwordTextController.text;
    loginState(LoginState.initial);
    loginState(LoginState.loading);

    final loginResponse =
        await loginUseCase.login(LoginRequest(username, password));

    userId(loginResponse.id);
    loginState(LoginState.initial);
    return loginResponse.response;
  }

  void onClose() {
    usernameTextController?.dispose();
    passwordTextController?.dispose();
    super.onClose();
  }
}
