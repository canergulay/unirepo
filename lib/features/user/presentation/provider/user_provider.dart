import 'dart:io';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/cupertino.dart';
import 'package:unirepo/core/firebase_manager/firebase_manager.dart';
import 'package:unirepo/core/firebase_manager/repo/collectiong_getters.dart';
import 'package:unirepo/core/freezed/result/result.dart';
import 'package:unirepo/features/user/data/models/user_profile.dart';
import 'package:unirepo/features/user/domain/usecases/get_user_info.dart';
import 'package:image_picker/image_picker.dart';
import 'package:unirepo/features/user/presentation/provider/avatar_provider.dart';

class UserProfileProvider extends ChangeNotifier {
  final AvatarProvider avatarProvider;
  final GetUserInfo getUserInfo;
  UserProfile? userProfile;
  UserProfileProvider({
    required this.getUserInfo,
    required this.avatarProvider,
  });

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
