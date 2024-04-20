import 'dart:async';
import 'package:flutter_bloc_example/screens/register_screen/model/signUp_model.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

sealed class IFirebaseAuthService {
  Future<void> signUp(SignUpModel? model);
  Future<void> signIn(String? email, String? password);
  Future<void> updatePassword(String email);
  Future<void> signOut();
}

class FirebaseAuthService extends IFirebaseAuthService {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore _fireStore = FirebaseFirestore.instance;
  @override
  Future<void> signUp(SignUpModel? model) async {
    final SignUpModel(:name, :password, :surname, :phoneNumber, :email) =
        model!;

    try {
      UserCredential credential = await _auth.createUserWithEmailAndPassword(
        email: model.email!,
        password: model.password!,
      );

      final user = credential.user;
      if (user != null) {
        await _fireStore.collection("users").doc(user.uid).set({
          "name": name,
          "surname": surname,
          "email": email,
          "password": password,
          "phoneNumber": phoneNumber,
        });
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

  @override
  Future<void> updatePassword(String? email) async {
    try {
      if (email != null) {
        await _auth.sendPasswordResetEmail(email: email);
      }
    } on FirebaseException catch (e) {
      throw Exception(e.toString());
    }
  }

  @override
  Future<void> signOut() async {
    try {
      await _auth.signOut();
    } on FirebaseAuthException catch (e) {
      throw Exception(e);
    }
  }
}
