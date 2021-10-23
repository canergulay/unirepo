import 'package:unirepo/core/freezed/result/result.dart';
import 'package:unirepo/features/user/data/repositories/login_with_email_password_repositary.dart';
import 'package:unirepo/features/user/domain/entities/login_entity.dart';

class LoginWithEmailPassword {
  final LoginWithEmailPasswordRepositary loginWithEmailPasswordRepositary;
  const LoginWithEmailPassword({required this.loginWithEmailPasswordRepositary});
  Future<Result<bool, Exception>> call({required LoginEntity loginEntity}) async {
    return await loginWithEmailPasswordRepositary.loginWithEmailPassword(loginEntity);
  }
}
