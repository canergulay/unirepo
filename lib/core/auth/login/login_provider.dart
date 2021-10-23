import 'package:flutter/cupertino.dart';
import 'package:unirepo/core/auth/manager/authentication_provider.dart';
import 'package:unirepo/core/init/injection/get_them_all.dart';
import 'package:unirepo/features/user/domain/entities/login_entity.dart';
import 'package:unirepo/features/user/domain/usecases/login_with_email_password.dart';

class LoginManager {
  final AuthenticationProvider authenticationProvider;
  late final LoginWithEmailPassword _loginWithEmailPassword;
  LoginManager({required this.authenticationProvider}) {
    _loginWithEmailPassword = injector.get<LoginWithEmailPassword>();
  }
  final loginFormKey = GlobalKey<FormState>();
  final TextEditingController mailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  void onLoginButtonTap() {
    final LoginEntity _loginEntity = LoginEntity(
      email: mailController.text,
      password: passwordController.text,
    );
    _loginWithEmailPassword(loginEntity: _loginEntity);
    loginFormKey.currentState?.validate();
  }
}
