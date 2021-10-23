import 'package:unirepo/core/freezed/result/result.dart';
import 'package:unirepo/features/user/data/models/user_profile.dart';
import 'package:unirepo/features/user/data/repositories/get_user_info_repositary.dart';

class GetUserInfo {
  final GetUserInfoRepositary getUserInfoRepositary;
  const GetUserInfo({required this.getUserInfoRepositary});
  Future<Result<UserProfile, Exception>> call() async {
    return await getUserInfoRepositary.getUserInfo();
  }
}
