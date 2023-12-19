import 'package:firebase_auth/firebase_auth.dart';

import '../../../bases/controllers/exports.dart';

class OtpService {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  Future<void> loginWithSmsCode(String smsCode, String verificationId) async {
    try {
      PhoneAuthCredential credential = PhoneAuthProvider.credential(
        verificationId: verificationId,
        smsCode: smsCode,
      );
      await _auth.signInWithCredential(credential);
    } catch (e) {
      Debugger.red('Error while sign in with SMS Code: $e');
    }
  }
}
