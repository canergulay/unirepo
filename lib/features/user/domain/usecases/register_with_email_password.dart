import 'package:unirepo/core/freezed/result/result.dart';
import 'package:unirepo/features/user/data/repositories/register_with_email_password_repositary.dart';
import 'package:unirepo/features/user/domain/entities/registration_entity.dart';

class RegisterWithEmailPassword {
  final RegisterWithEmailPasswordRepositary registerWithEmailPasswordRepositary;
  const RegisterWithEmailPassword({required this.registerWithEmailPasswordRepositary});
  Future<Result<bool, Exception>> call(RegistrationEntity registrationEntity) async {
    return await registerWithEmailPasswordRepositary.registerWithEmailPassword(registrationEntity);
  }
}
