import 'package:flutter/cupertino.dart';
import 'package:unirepo/core/freezed/result/result.dart';
import 'package:unirepo/features/user/data/models/user_profile.dart';
import 'package:unirepo/features/user/domain/usecases/get_user_info.dart';

class UserProfileProvider extends ChangeNotifier {
  final GetUserInfo getUserInfo;
  UserProfile? userProfile;
  UserProfileProvider({required this.getUserInfo});

  Future<void> activateUserProfile() async {
    Result<UserProfile, Exception> result = await getUserInfo();
    result.when(success: (UserProfile profile) {
      userProfile = profile;
      notifyListeners();
    }, error: (Exception e) {
      print(e);
    });
  }

  bool get hasProfileData => userProfile != null;
  UserProfile get userData => userProfile!;
}
