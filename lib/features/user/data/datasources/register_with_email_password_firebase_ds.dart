import 'package:firebase_auth/firebase_auth.dart';
import 'package:unirepo/core/firebase_manager/firebase_manager.dart';
import 'package:unirepo/features/user/data/datasources/login_with_email_password.dart';
import 'package:unirepo/features/user/domain/entities/registration_entity.dart';

class RegisterWithEmailPasswordFirebaseDS {
  Future<bool> registerViaFirebase({required RegistrationEntity registrationEntity}) async {
    UserCredential userCredential = await FirebaseAuth.instance.createUserWithEmailAndPassword(
      email: registrationEntity.mail,
      password: registrationEntity.password,
    );
    await FireBaseManager.instance.createDocumentInCollection<User>(
      docIdToBeCreated: userCredential.user?.uid ?? '',
      data: {'name': registrationEntity.userName},
    );

    final tokenn = await userCredential.user?.getIdToken();
    return true;
  }
}
