import 'package:unirepo/core/freezed/result/result.dart';
import 'package:unirepo/features/user/domain/entities/login_entity.dart';

abstract class ILoginWithEmailPasswordRepo {
  Future<Result<bool, Exception>> loginWithEmailPassword(LoginEntity loginEntity);
}
