import 'package:firebase_storage/firebase_storage.dart';
import 'package:unirepo/core/firebase_manager/firebase_manager.dart';
import 'package:unirepo/core/firebase_manager/repo/collection_paths_by_type.dart';
import 'package:unirepo/core/firebase_manager/repo/collectiong_getters.dart';
import 'package:unirepo/core/freezed/result/result.dart';

mixin GetDefaultAvatar {
  Future<Result<String, Exception>> fetchDefaultAvatar() async {
    return await FireBaseManager.instance.getImageFromStorage(
      dirName: FireBaseDirNames.shared.avatars,
      fileName: 'default',
    );
  }
}
