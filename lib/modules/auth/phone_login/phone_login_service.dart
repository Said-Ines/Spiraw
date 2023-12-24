import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

import '../../../app/constants/firebase_collections.dart';
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

  Future<bool> isUserRegistered(String phoneNumber) async {
    try {
      final QuerySnapshot<Map<String, dynamic>> result = await FirebaseFirestore.instance
          .collection(FirebaseCollections.users)
          .where('phoneNumber', isEqualTo: phoneNumber)
          .get();
      return result.docs.isNotEmpty;
    } catch (e) {
      Debugger.red('Error checking user registration: $e');
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
