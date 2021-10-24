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

  Future<void> changeUserProfile() async {
    final ImagePicker _picker = ImagePicker();
    try {
      XFile? pickedImage = await _picker.pickImage(source: ImageSource.gallery);
      if (pickedImage != null) {
        final Result<String, Exception> uploadResult = await FireBaseManager.instance.uploadImage(
          pickedImage.path,
          dirName: FireBaseDirNames.shared.avatars,
          fileName: FirebaseAuth.instance.currentUser?.uid ?? '',
        );
        uploadResult.when(success: (String path) async {
          final String downloadURL = await FirebaseStorage.instance.ref(path).getDownloadURL();
        }, error: (Exception e) {
          print(e);
        });
      }
    } catch (e) {
      print(e);
    }
  }
}
