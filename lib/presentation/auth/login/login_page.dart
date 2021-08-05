import 'package:cruz_roja/global/routes/routes.dart';
import 'package:cruz_roja/global/theme/theme.dart';
import 'package:cruz_roja/presentation/auth/login/login_controller.dart';
import 'package:cruz_roja/presentation/auth/widgets/custom_button.dart';
import 'package:cruz_roja/presentation/auth/widgets/custom_textfield.dart';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LoginPage extends GetWidget<LoginController> {
  void login() async {
    final result = await controller.login();
    if (result) {
      Get.offAllNamed(AppRoutes.home);
    } else {
      Get.snackbar('Error', 'Invalid username or password');
    }
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Scaffold(
      backgroundColor: AppColors.red,
      body: Stack(
        alignment: Alignment.center,
        children: [
          SingleChildScrollView(
            child: Container(
              height: size.height,
              width: size.width,
              padding: const EdgeInsets.symmetric(horizontal: 23.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Expanded(
                    flex: 2,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Image.asset(
                          'assets/Icono_vertical.jpg',
                          alignment: Alignment.center,
                        ),
                      ],
                    ),
                  ),
                  // SizedBox(
                  //   height: size.height / 8,
                  // ),
                  // Text(
                  //   'CRUZ ROJA',
                  //   style: Theme.of(context).textTheme.headline1.copyWith(
                  //       color: Colors.white,
                  //       fontSize: 50.0,
                  //       fontWeight: FontWeight.bold),
                  // ),
                  // Text(
                  //   'Seccional Atlántico',
                  //   style: Theme.of(context).textTheme.headline1.copyWith(
                  //       color: Colors.white,
                  //       fontSize: 30,
                  //       fontWeight: FontWeight.bold),
                  // ),
                  // Text(
                  //   'Voluntarios',
                  //   style: Theme.of(context).textTheme.headline1.copyWith(
                  //       color: Colors.white,
                  //       fontSize: 28,
                  //       fontWeight: FontWeight.bold),
                  // ),
                  // SizedBox(
                  //   height: size.height / 10,
                  // ),
                  Expanded(
                    flex: 2,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        CustomTextField(
                          controller: controller.usernameTextController,
                          preffix: Icon(Icons.person),
                          hintText: 'E-mail',
                          isDense: false,
                        ),
                        const SizedBox(
                          height: 15.0,
                        ),
                        CustomTextField(
                          controller: controller.passwordTextController,
                          preffix: Icon(Icons.lock),
                          hintText: 'Contraseña',
                          isObscure: true,
                          isDense: false,
                        ),
                        const SizedBox(
                          height: 15.0,
                        ),
                        CustomButton(
                          backgroundColor: AppColors.white,
                          text: Text(
                            'Iniciar sesión',
                            style: Theme.of(context)
                                .textTheme
                                .bodyText1
                                .copyWith(fontSize: 20, color: AppColors.red),
                          ),
                          borderColor: Colors.transparent,
                          onPressed: login,
                        ),
                        SizedBox(
                          height: 20.0,
                        ),
                      ],
                    ),
                  ),

                  // GestureDetector(
                  //   child: Text(
                  //     'Registrarme',
                  //     style: Theme.of(context).textTheme.bodyText1.copyWith(
                  //         fontSize: 20,
                  //         color: AppColors.white,
                  //         decoration: TextDecoration.underline),
                  //   ),
                  //   onTap: () {},
                  // )
                ],
              ),
            ),
          ),
          Obx(() {
            if (controller.loginState.value == LoginState.loading) {
              return Container(
                color: Colors.black26,
                child: Center(
                  child: CircularProgressIndicator(),
                ),
              );
            } else {
              return SizedBox.shrink();
            }
          })
        ],
      ),
    );
  }
}
