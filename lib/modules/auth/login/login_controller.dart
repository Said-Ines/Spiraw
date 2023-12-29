import 'package:firebase_auth/firebase_auth.dart';

import '../../../bases/controllers/exports.dart';
import 'login_service.dart';

class LoginController extends GetxController {
  final inputControls = InputControl.generate(2);
  final formKey = GlobalKey<FormState>();
  final performingApiCall = Observable(false);
  final LoginService loginService = LoginService();
  final isActive = Observable(false);

  void toSignUp() {
    Get.toNamed(signupModule.name);
  }

  void updateFormValidity() {
    bool isFormValid = true;

    for (var control in inputControls) {
      if (control.controller.text.isEmpty) {
        isFormValid = false;
        break;
      }
    }
    isActive.value = isFormValid;
  }

  Future<void> login() async {
    try {
      performingApiCall.toggle();
      if (formKey.currentState!.validate()) {
        final User? user = await loginService.loginWithEmailAndPassword(
          inputControls[0].controller.text.trim(),
          inputControls[1].controller.text.trim(),
        );
        if (user != null) {
          Debugger.green("User Authenticated: ${user.uid}");
          Get.offAllNamed(recipePageModule.name);
        }
      }
    } catch (error) {
      Debugger.red('Erreur de connexion: $error');
    } finally {
      performingApiCall.toggle();
    }
  }

  void toSignUpModule() => Get.offNamed(signupModule.name);

  @override
  void onClose() {
    inputControls.disposeAll();
    super.onClose();
  }
}
