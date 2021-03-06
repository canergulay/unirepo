import 'package:flutter/cupertino.dart';
import 'package:unirepo/core/auth/manager/authentication_provider.dart';
import 'package:unirepo/core/freezed/result/result.dart';
import 'package:unirepo/core/init/injection/get_them_all.dart';
import 'package:unirepo/features/user/domain/entities/registration_entity.dart';
import 'package:unirepo/features/user/domain/usecases/register_with_email_password.dart';

class RegisterManager {
  final AuthenticationProvider authenticationProvider;
  late final RegisterWithEmailPassword _registerWithEmailPassword;
  RegisterManager({required this.authenticationProvider}) {
    _registerWithEmailPassword = injector.get<RegisterWithEmailPassword>();
  }

  final TextEditingController userNameController = TextEditingController();
  final TextEditingController mailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final formKey = GlobalKey<FormState>();

  Future<void> register({required RegistrationEntity registrationEntity}) async {
    final Result<bool, Exception> result = await _registerWithEmailPassword(registrationEntity);
    print('burası');
    result.when(
        success: (bool sonuc) {},
        error: (Exception e) {
          print(e);
        });
  }

  void onRegisterButtonTap() {
    bool? isValidated = formKey.currentState?.validate();
    if (isValidated != null && isValidated == true) {
      final RegistrationEntity registrationEntity = RegistrationEntity(
        mail: mailController.text,
        password: passwordController.text,
        userName: userNameController.text,
      );
      _registerWithEmailPassword(registrationEntity);
    } else {}
  }
}
