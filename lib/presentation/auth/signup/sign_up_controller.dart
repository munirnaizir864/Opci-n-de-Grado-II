import 'package:cruz_roja/domain/entities/login_request.dart';
import 'package:cruz_roja/domain/usecases/auth_usecase.dart';
import 'package:cruz_roja/domain/usecases/user_usecase.dart';
import 'package:cruz_roja/presentation/auth/login/login_controller.dart';
import 'package:get/get.dart';
import 'package:flutter/material.dart';

class SignUpController extends GetxController {
  final UserUseCases userUseCases;
  final AuthUseCase loginUseCase;

  SignUpController({this.userUseCases, this.loginUseCase});

  final nameTextController = TextEditingController();
  final passwordTextController = TextEditingController();

  var loginState = LoginState.initial.obs;

  // Future<bool> signUp() async {
  //   final name = nameTextController.text;
  //   final password = passwordTextController.text;
  //   loginState(LoginState.loading);
  //   try {
  //     final loginResponse =
  //         await loginUseCase.login(LoginRequest(name, password));
  //     await userUseCases.saveToken(loginResponse.token);
  //     await userUseCases.saveUser(loginResponse.user);

  //     return true;
  //   } catch (e) {
  //     print(e);
  //     loginState(LoginState.initial);
  //     return false;
  //   }
  // }
}
