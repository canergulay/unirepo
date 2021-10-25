import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/cupertino.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';
import 'package:unirepo/core/firebase_manager/firebase_manager.dart';
import 'package:unirepo/core/firebase_manager/mixins/get_default_avatar_mixin.dart';
import 'package:unirepo/core/firebase_manager/repo/collectiong_getters.dart';
import 'package:unirepo/core/freezed/result/result.dart';

class AvatarProvider extends ChangeNotifier with GetDefaultAvatar {
  // We will check whether the avatarURL is null, then return LoadingIndicator,
  // At the same time, we will trigger getuserAvatar method within the initState, or constructor.
  // Then we'll be able to show either user's avatar or default avatar. That's all.
  String? avatarURL;
  AvatarProvider();
  //
  Future<void> getuserAvatar() async {
    final Result<String, Exception> result = await FireBaseManager.instance.getImageFromStorage(
      dirName: FireBaseDirNames.shared.avatars,
      fileName: FirebaseAuth.instance.currentUser?.uid ?? '',
    );

    // DATA CLASSES ARE PERFECT TOOLS,
    // I ALWAYS EMBRACE AND GO FOR IT.
    result.when(
      success: _setAvatarWithGivenUrl,
      error: _fetchDefaultAndActivate,
    );
  }

  Future<void> _fetchDefaultAndActivate(Exception e) async {
    final String defaultAvatar = await _getDefaultAvatar();
    _setAvatarWithGivenUrl(defaultAvatar);
  }

  Future<String> _getDefaultAvatar() async {
    final Result<String, Exception> result = await fetchDefaultAvatar();
    late final defaultAvatarUrl;
    result.when(success: (String url) {
      defaultAvatarUrl = url;
    }, error: (e) {
      defaultAvatarUrl = '';
    });
    return defaultAvatarUrl;
  }

  Future<void> changeUserAvatar() async {
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
          _setAvatarWithGivenUrl(downloadURL);
        }, error: (Exception e) {
          print(e);
        });
      }
    } catch (e) {
      print(e);
    }
  }

  void _setAvatarWithGivenUrl(String url) {
    avatarURL = url;
    notifyListeners();
  }
}
