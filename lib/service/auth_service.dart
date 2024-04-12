import 'package:flutter_bloc_example/screens/register_screen/model/signUp_model.dart';
import 'package:firebase_auth/firebase_auth.dart';

sealed class IFirebaseAuthService {
  Future<void> signUp(SignUpModel? model);
  Future<void> signIn(String? email, String? password);
}

class FirebaseAuthService extends IFirebaseAuthService {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  @override
  Future<void> signUp(SignUpModel? model) async {
    try {
      if (model != null) {
        await _auth.createUserWithEmailAndPassword(
          email: model.email!,
          password: model.password!,
        );
      }
    } catch (e) {
      throw Exception(e.toString());
    }
  }

  @override
  Future<void> signIn(String? email, String? password) async {
    try {
      if (email != null && password != null) {
        await _auth.signInWithEmailAndPassword(
            email: email, password: password);
      }
    } catch (e) {
      throw Exception(e.toString());
    }
  }
}
