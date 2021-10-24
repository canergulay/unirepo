import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';
import 'package:unirepo/core/firebase_manager/firebase_manager.dart';
import 'package:unirepo/core/firebase_manager/repo/collectiong_getters.dart';
import 'package:unirepo/core/freezed/result/result.dart';

class AvatarProvider extends ChangeNotifier {
  String? avatarURL;
  AvatarProvider({required this.avatarURL});
  Future<void> getuserAvatar() async {
    final Result<String, Exception> result = await FireBaseManager.instance.getImageFromStorage(
      dirName: FireBaseDirNames.shared.avatars,
      fileName: FirebaseAuth.instance.currentUser?.uid ?? '',
    );

    result.when(success: (String url) {
      avatarURL = url;
      notifyListeners();
    }, error: (Exception e) {
      print(e);
    });
  }

  Future<String> getUserAvatar() async {
    // TO BE CONTINED !
    if (avatarURL == null) {}
  }
}
