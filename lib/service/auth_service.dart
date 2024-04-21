import 'dart:async';
import 'dart:io';
import 'package:flutter_bloc_example/screens/register_screen/model/signUp_model.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';

sealed class IFirebaseAuthService {
  Future<void> signUp(SignUpModel? model);
  Future<void> signIn(String? email, String? password);
  Future<void> updatePassword(String email);
  Future<void> signOut();
  Future<Map<String, dynamic>?> fetchUserInformation();
  Future<String?> setUserImage(File? imageFile);
}

class FirebaseAuthService extends IFirebaseAuthService {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore _fireStore = FirebaseFirestore.instance;
  final storage = FirebaseStorage.instance;
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

  @override
  Future<Map<String, dynamic>?> fetchUserInformation() async {
    final user = _auth.currentUser;
    if (user != null) {
      final snapshot = await _fireStore.collection("users").doc(user.uid).get();
      Map<String, dynamic>? data = snapshot.data();
      if (data != null) {
        return data;
      } else {
        return null;
      }
    }
    return null;
  }

  @override
  Future<String?> setUserImage(File? imageFile) async {
    final user = _auth.currentUser;
    if (user != null) {
      final ref = FirebaseStorage.instance.ref();
      final imageReference = ref.child('userImages/${user.displayName}.png');
      await imageReference.putFile(imageFile!, SettableMetadata(contentType: 'image/png'));
      final url = await imageReference.getDownloadURL();
      return url;
    }
    return null;
  }
}
