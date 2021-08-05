import 'package:cruz_roja/global/theme/theme.dart';
import 'package:cruz_roja/presentation/auth/widgets/custom_button.dart';
import 'package:cruz_roja/presentation/auth/widgets/custom_textfield.dart';
import 'package:cruz_roja/presentation/auth/widgets/rounded_rectangle_checkbox.dart';
import 'package:flutter/material.dart';

class SignUpPage extends StatelessWidget {
  const SignUpPage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    bool val = true;
    return SafeArea(
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 25.0, vertical: 15.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Text(
                'Registro',
                style: Theme.of(context).textTheme.headline1.copyWith(
                    fontSize: 33,
                    color: AppColors.black,
                    fontWeight: FontWeight.w600),
                textAlign: TextAlign.center,
              ),
              const SizedBox(
                height: 20.0,
              ),
              CustomTextField(
                preffix: Icon(
                  Icons.person_rounded,
                  color: Theme.of(context).iconTheme.color,
                ),
                hintText: 'Nombre',
              ),
              const SizedBox(
                height: 15.0,
              ),
              CustomTextField(
                preffix: Icon(
                  Icons.email_sharp,
                  color: Theme.of(context).iconTheme.color,
                ),
                hintText: 'Correo',
              ),
              const SizedBox(
                height: 15.0,
              ),
              CustomTextField(
                preffix: Icon(
                  Icons.phone,
                  color: Theme.of(context).iconTheme.color,
                ),
                hintText: 'Teléfono',
              ),
              const SizedBox(
                height: 15.0,
              ),
              CustomTextField(
                preffix: Icon(
                  Icons.person_outline,
                  color: Theme.of(context).iconTheme.color,
                ),
                hintText: 'Carnet',
              ),
              const SizedBox(
                height: 15.0,
              ),
              CustomTextField(
                preffix: Icon(
                  Icons.lock,
                  color: Theme.of(context).iconTheme.color,
                ),
                hintText: 'Contraseña',
              ),
              const SizedBox(
                height: 15.0,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 25.0),
                child: RichText(
                    text: TextSpan(
                        text: 'Seguridad de la contraseña  ',
                        style: Theme.of(context)
                            .textTheme
                            .bodyText1
                            .copyWith(color: Colors.grey),
                        children: [
                      TextSpan(
                          text: 'Fuerte',
                          style: Theme.of(context)
                              .textTheme
                              .bodyText1
                              .copyWith(color: AppColors.green))
                    ])),
              ),
              const SizedBox(
                height: 20.0,
              ),
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  //Checkbox(value: false, onChanged: (value) {}),
                  CustomCheckBox(
                    value: true,
                    onTap: () {},
                  ),
                  const SizedBox(
                    width: 6.0,
                  ),
                  RichText(
                    text: TextSpan(
                        text: 'Acepto los ',
                        style: Theme.of(context).textTheme.bodyText1.copyWith(
                              color: AppColors.black,
                              fontSize: 15,
                            ),
                        children: [
                          TextSpan(
                              text: 'Términos y condiciones',
                              style: Theme.of(context)
                                  .textTheme
                                  .bodyText1
                                  .copyWith(
                                      color: AppColors.pink,
                                      decoration: TextDecoration.underline))
                        ]),
                  ),
                ],
              ),
              const SizedBox(
                height: 20.0,
              ),
              CustomButton(
                backgroundColor: AppColors.pink,
                text: Text(
                  'Registrarme',
                  style: Theme.of(context).textTheme.headline1.copyWith(
                        fontSize: 18.0,
                        color: AppColors.white,
                        fontWeight: FontWeight.bold,
                      ),
                ),
                onPressed: () {},
              )
            ],
          ),
        ),
      ),
    );
  }
}
