import 'package:cs_app/model/user_model.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class UserProvider with ChangeNotifier {
  UserModel? _currentUser;

  UserModel? get currentUser => _currentUser;

  final FirebaseAuth _auth = FirebaseAuth.instance;

  Future<void> login(String email, String password) async {
    try {
      final userCredential = await _auth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      if (userCredential.user != null) {
        final uid = userCredential.user!.uid;
        final userDoc = await FirebaseFirestore.instance
            .collection('users')
            .doc(userCredential.user!.uid)
            .get();
        if (userDoc.exists) {
          String name = userDoc['name'];
          int projects = userDoc['projects'];
          int donation = userDoc['donation'];

          _currentUser = UserModel(
              uid: uid, name: name, projects: projects, donation: donation);
          notifyListeners();
        }
      }
    } catch (e) {
      throw e;
    }
  }

  Future<void> signUp(String name, String email, String password) async {
    try {
      final userCredential = await _auth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      if (userCredential.user != null) {
        await userCredential.user!.updateProfile(displayName: name);
        await FirebaseFirestore.instance
            .collection('users')
            .doc(userCredential.user!.uid)
            .set({
          'name': name,
          'email': email,
          'projects': 0,
          'donation': 0,
        });
      }
    } catch (e) {
      throw e;
    }
  }
}
