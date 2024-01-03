import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

import '../../../app/constants/firebase_collections.dart';
import '../../../helpers/index.dart';

class LoginService {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  LoginService._();

  static LoginService instance = LoginService._();
  LoginService();

  get currentUser => _auth.currentUser;
  Future<User?> loginWithEmailAndPassword(String email, String password) async {
    try {
      final UserCredential userCredential = await _auth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );

      return userCredential.user;
    } catch (error) {
      Debugger.red('Error while signing in: $error');
      rethrow;
    }
  }

  Future<bool> isUserRegistered(String email) async {
    try {
      final QuerySnapshot<Map<String, dynamic>> snapshot =
          await FirebaseFirestore.instance.collection(FirebaseCollections.users).where('email', isEqualTo: email).get();

      return snapshot.docs.isNotEmpty;
    } catch (e) {
      Debugger.red('Error checking user registration: $e');
      return false;
    }
  }

  Future<bool> isPasswordValid(String email, String password) async {
    try {
      final QuerySnapshot<Map<String, dynamic>> snapshot = await FirebaseFirestore.instance
          .collection(FirebaseCollections.users)
          .where('email', isEqualTo: email)
          .where('password', isEqualTo: password)
          .get();

      return snapshot.docs.isNotEmpty;
    } catch (e) {
      Debugger.red('Invalid password: $e');
      return false;
    }
  }

  Future<bool> isMachineRegisteredForUser(String? userId) async {
    if (userId == null) {
      return false;
    }
    try {
      final DocumentSnapshot<Map<String, dynamic>> snapshot =
          await FirebaseFirestore.instance.collection(FirebaseCollections.machines).doc(userId).get();

      return snapshot.exists;
    } catch (e) {
      Debugger.red('Error checking machine authentication: $e');
      return false;
    }
  }
}
