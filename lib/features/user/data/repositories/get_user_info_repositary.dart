import 'package:unirepo/features/user/data/datasources/get_user_info_datasource.dart';
import 'package:unirepo/features/user/data/models/user_profile.dart';
import 'package:unirepo/core/freezed/result/result.dart';
import 'package:unirepo/features/user/domain/repositories/get_user_info_by_id_repositary_contract.dart';

class GetUserInfoRepositary implements IGetUserInfoRepositary {
  final GetUserInfoDataSource getUserInfoDataSource;
  const GetUserInfoRepositary({required this.getUserInfoDataSource});
  @override
  Future<Result<UserProfile, Exception>> getUserInfo() async {
    try {
      final UserProfile userProfile = await getUserInfoDataSource.getUserProfile();
      return Result.success(userProfile);
    } catch (e) {
      print(e);
      return Result.error(Exception(e));
    }
  }
}
