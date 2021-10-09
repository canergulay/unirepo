import 'package:firebase_auth/firebase_auth.dart';
import 'package:unirepo/features/user/domain/entities/registration_entity.dart';

class RegisterWithEmailPasswordFirebaseDS {
  Future<bool> registerViaFirebase({required RegistrationEntity registrationEntity}) async {
    UserCredential userCredential = await FirebaseAuth.instance.createUserWithEmailAndPassword(
      email: registrationEntity.mail,
      password: registrationEntity.password,
    );
    print(userCredential);
    return true;
  }
}
