import 'package:firebase_auth/firebase_auth.dart';
import 'package:unirepo/core/firebase_manager/firebase_manager.dart';
import 'package:unirepo/core/firebase_manager/mixins/get_single_document.dart';
import 'package:unirepo/features/user/data/models/user_profile.dart';

class GetUserInfoDataSource with GetSingleConvertedDocument<UserProfile> {
  Future<UserProfile> getUserProfile() async {
    return await getSingleDocument(
      responseType: UserProfile(),
      docID: FirebaseAuth.instance.currentUser?.uid ?? '',
    );
  }
}
