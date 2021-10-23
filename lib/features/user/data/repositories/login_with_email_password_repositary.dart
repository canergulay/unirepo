import 'package:unirepo/features/user/data/datasources/login_with_email_password.dart';
import 'package:unirepo/features/user/domain/entities/login_entity.dart';
import 'package:unirepo/core/freezed/result/result.dart';
import 'package:unirepo/features/user/domain/repositories/login_with_email_password_repositary_contract.dart';

class LoginWithEmailPasswordRepositary implements ILoginWithEmailPasswordRepo {
  final LoginWithEmailPasswordFirebaseDS loginWithEmailPasswordFirebaseDS;
  LoginWithEmailPasswordRepositary({required this.loginWithEmailPasswordFirebaseDS});

  @override
  Future<Result<bool, Exception>> loginWithEmailPassword(LoginEntity loginEntity) async {
    // TODO: implement loginWithEmailPassword
    try {
      final result = await loginWithEmailPasswordFirebaseDS.loginViaFirebase(loginEntity: loginEntity);
      if (result) {
        return Result.success(true);
      }
      return Result.error(Exception());
    } catch (e) {
      print(e);
      return Result.error(Exception());
    }
  }
}
