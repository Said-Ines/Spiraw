import 'package:firebase_auth/firebase_auth.dart';

import '../../../app/colors/app_colors.dart';
import '../../../bases/controllers/exports.dart';
import '../../../bases/modules/exports.dart';
import 'login_service.dart';

class LoginController extends GetxController {
  final inputControls = InputControl.generate(2);
  final formKey = GlobalKey<FormState>();
  final performingApiCall = Observable(false);
  final LoginService loginService = LoginService();
  final isActive = Observable(false);

  void toSignUp() {
    Get.offAllNamed(signupModule.name);
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
      final email = inputControls[0].controller.text.trim();
      final password = inputControls[1].controller.text.trim();

      bool isUserRegistered = await loginService.isUserRegistered(email);
      bool isPasswordValid = await loginService.isPasswordValid(email, password);

      if (formKey.currentState!.validate()) {
        if (!isUserRegistered) {
          Get.snackbar(
            "User Not Found",
            "This email is not registered. Please sign up first.",
            snackPosition: SnackPosition.BOTTOM,
            backgroundColor: AppColors.remove,
            colorText: Colors.white,
          );
          return;
        }
        if (!isPasswordValid) {
          Get.snackbar(
            "Invalid Password",
            "Please check your password and try again.",
            snackPosition: SnackPosition.BOTTOM,
            backgroundColor: AppColors.remove,
            colorText: Colors.white,
          );
          return;
        }
        final User? user = await loginService.loginWithEmailAndPassword(email, password);

        if (user != null) {
          final isMachineAuthenticated = await loginService.isMachineRegisteredForUser(user.uid);

          isMachineAuthenticated ? Get.offAllNamed(recipePageModule.name) : Get.offAllNamed(getStartedModule.name);
          Debugger.green("User Authenticated: ${user.uid}");
        }
      }
    } on FirebaseAuthException catch (error) {
      if (error.code == 'wrong-password') {
        Get.snackbar(
          "Invalid Password",
          "Please check your password and try again.",
          snackPosition: SnackPosition.BOTTOM,
          backgroundColor: AppColors.remove,
          colorText: Colors.white,
        );
      } else {
        Get.snackbar(
          "Error",
          "Something went wrong. Please try again later.",
          snackPosition: SnackPosition.BOTTOM,
          backgroundColor: AppColors.remove,
          colorText: Colors.white,
        );
        Debugger.red('Erreur de connexion: $error');
      }
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
