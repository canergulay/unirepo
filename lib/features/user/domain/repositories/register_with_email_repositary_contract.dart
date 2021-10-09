import 'package:unirepo/core/freezed/result.dart';
import 'package:unirepo/features/user/domain/entities/registration_entity.dart';

abstract class IRegisterWithEmailPassword {
  Future<Result<bool, Exception>> registerWithEmailPassword(RegistrationEntity registrationEntity);
}
