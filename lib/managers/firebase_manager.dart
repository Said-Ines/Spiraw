import 'package:firebase_auth/firebase_auth.dart';

import '../bases/screens/exports.dart';
import '../helpers/index.dart';
import '../modules/auth/data/model/user_model.dart';

final firebaseManager = Get.find<FirebaseManager>();

class FirebaseManager {
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

  Future<UserModel?> registerWithEmailAndPassword({
    required String username,
    required String email,
    required String password,
  }) async {
    try {
      UserCredential authResult = await _auth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );

      User? user = authResult.user;
      if (user != null) {
        await user.updateDisplayName(username);
        // return UserModel.fromFirebaseUser(user);
        UserModel userModel = UserModel(
          uid: user.uid,
          username: username,
          email: email,
          password: password,
          phoneNumber: '',
          userImage: '',
        );

        return userModel;
      }

      return null;
    } catch (e) {
      Debugger.red('Error register with email and password : $e');

      return null;
      //TODO:  Handle register error
    }
  }

  // Sign out the user
  Future<void> signOut() async {
    try {
      await _auth.signOut();
    } catch (e) {
      Debugger.red('Error signing out: $e');
      // TODO: Handle sign-out error
    }
  }
}


 // FirebaseMessaging messaging = FirebaseMessaging.instance;

 // Future<void> requestNotificationPermissions() async {
   // NotificationSettings settings = await messaging.requestPermission(
    //  alert: true,
    //  announcement: false,
    //  badge: true,
     // carPlay: false,
     // criticalAlert: false,
     // provisional: false,
     // sound: true,
  //  );

  //  if (settings.authorizationStatus == AuthorizationStatus.authorized) {
      //User granted permission
   // } else if (settings.authorizationStatus == AuthorizationStatus.provisional) {
      // User granted provisional permission
   // } else {
      //User declined or has not accepted permission
   // }
 // }