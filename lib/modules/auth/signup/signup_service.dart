import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

import '../../../app/constants/firebase_collections.dart';
import '../../../bases/controllers/exports.dart';
import '../data/model/user_model.dart';

class SignUpService {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore _firebase = FirebaseFirestore.instance;

  Future<void> signUp(UserModel user) async {
    try {
      UserCredential authResult = await _auth.createUserWithEmailAndPassword(
        email: user.email,
        password: user.password,
      );
      await _firebase.collection(FirebaseCollections.users).doc(authResult.user!.uid).set(user.toMap());
    } catch (e) {
      Debugger.red('Error while signing up: $e');
      rethrow;
    }
  }
}
