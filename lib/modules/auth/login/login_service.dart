import 'package:firebase_auth/firebase_auth.dart';

import '../../../helpers/index.dart';

class LoginService {
  final FirebaseAuth _auth = FirebaseAuth.instance;

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
}
