import 'package:unirepo/features/user/data/datasources/register_with_email_password_firebase_ds.dart';
import 'package:unirepo/features/user/domain/entities/registration_entity.dart';
import 'package:unirepo/core/freezed/result.dart';
import 'package:unirepo/features/user/domain/repositories/register_with_email_repositary_contract.dart';

class RegisterWithEmailPasswordRepositary implements IRegisterWithEmailPassword {
  final RegisterWithEmailPasswordFirebaseDS registerWithEmailPasswordFirebaseDS;
  const RegisterWithEmailPasswordRepositary({required this.registerWithEmailPasswordFirebaseDS});
  @override
  Future<Result<bool, Exception>> registerWithEmailPassword(RegistrationEntity registrationEntity) {
    // TODO: implement registerWithEmailPassword
    throw UnimplementedError();
  }
}
