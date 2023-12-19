import 'package:firebase_auth/firebase_auth.dart';

import '../../../bases/controllers/exports.dart';

final phoneSignupService = Get.find<PhoneLoginService>();

class PhoneLoginService {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  Future<void> verifyPhoneNumber({
    required String phoneNumber,
    required void Function(String, int?) codeSent,
  }) async {
    try {
      await _auth.verifyPhoneNumber(
        phoneNumber: phoneNumber,
        verificationCompleted: _onVerificationCompleted,
        verificationFailed: _onVerificationFailed,
        codeSent: codeSent,
        codeAutoRetrievalTimeout: _onCodeAutoRetrievalTimeout,
      );
      Debugger.green('Verifying phone number: $phoneNumber');
    } catch (e) {
      //TODO:  Handle verification error
      Debugger.red('Error verifying phone number: $e');
    }
  }

  // Handle verification completed callback
  Future<void> _onVerificationCompleted(PhoneAuthCredential credential) async {
    try {
      await _auth.signInWithCredential(credential);
    } catch (e) {
      Debugger.red('Error signing in with credential: $e');
      //TODO:  Handle sign-in error
    }
  }

  // Handle verification failed callback
  void _onVerificationFailed(FirebaseAuthException e) {
    Debugger.red('Verification failed: ${e.message}');
    //TODO:  Handle verification failure
  }

  // Handle code sent callback
  void _onCodeSent(String verificationId, int? resendToken) {
    //TODO:  Handle code sent - you can perform actions like storing verificationId
  }

  // Handle code auto retrieval timeout callback
  void _onCodeAutoRetrievalTimeout(String verificationId) {
    //TODO: Handle code retrieval timeout
  }

  // Sign in using SMS code and verification ID
  Future<void> signInWithSmsCode(String smsCode, String verificationId) async {
    try {
      PhoneAuthCredential credential = PhoneAuthProvider.credential(
        verificationId: verificationId,
        smsCode: smsCode,
      );
      await _auth.signInWithCredential(credential);
    } catch (e) {
      Debugger.red('Error signing in with SMS code: $e');
      //TODO:  Handle sign-in error
    }
  }

  // Future<void> signUpWithPhone(String phone) async {
  //   await firebaseManager.verifyPhoneNumber(phoneNumber: phone, codeSent: (a, b) => {});
  // }

  // Future<void> verifySMS() async {
  //   await firebaseManager.signInWithSmsCode()
  // }
}
