import 'package:firebase_auth/firebase_auth.dart';
import 'package:unirepo/features/user/domain/entities/login_entity.dart';

class LoginWithEmailPasswordFirebaseDS {
  Future<bool> loginViaFirebase({required LoginEntity loginEntity}) async {
    UserCredential userCredential = await FirebaseAuth.instance.signInWithEmailAndPassword(
      email: loginEntity.email ?? '',
      password: loginEntity.password ?? '',
    );
    if (userCredential.user != null) {
      return true;
    } else {
      return false;
    }
  }
}
