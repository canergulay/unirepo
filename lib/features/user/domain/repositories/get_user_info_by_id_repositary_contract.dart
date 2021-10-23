import 'package:unirepo/core/freezed/result/result.dart';
import 'package:unirepo/features/user/data/models/user_profile.dart';

abstract class IGetUserInfoRepositary {
  Future<Result<UserProfile, Exception>> getUserInfo();
}
