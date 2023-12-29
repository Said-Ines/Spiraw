import 'package:firebase_auth/firebase_auth.dart';
import 'package:spiraw/bases/controllers/exports.dart';

class ProfileController extends GetxController {
  final _auth = FirebaseAuth.instance;

  void logout() async {
    await _auth.signOut();
    Get.offAllNamed(loginModule.name);
  }
}
