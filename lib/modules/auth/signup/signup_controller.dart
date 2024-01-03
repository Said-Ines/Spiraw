import 'package:uuid/uuid.dart';

import '../../../bases/models/input_control.dart';
import '../../../bases/screens/exports.dart';
import '../../../helpers/index.dart';
import '../../all_modules.dart';
import '../data/model/user_model.dart';
import 'signup_service.dart';

class SignUpController extends GetxController {
  final inputControls = InputControl.generate(4);
  final formKey = GlobalKey<FormState>();
  final SignUpService _signUpService = SignUpService();
  final isActive = Observable(false);

  void signUp() async {
    if (formKey.currentState!.validate()) {
      UserModel user = UserModel(
        uid: const Uuid().v4(),
        username: inputControls.first.controller.text,
        email: inputControls.second.controller.text,
        password: inputControls[2].controller.text,
      );
      try {
        await _signUpService.signUp(user);
        Debugger.green("user added successfully");
        Get.offNamed(loginModule.name);
      } catch (e) {
        Debugger.red("Error while signing up: $e");
      }
    }
  }

  Future<void> checkIfEmailExists() async {
    bool emailExists = await _signUpService.doesEmailExist(inputControls.second.controller.text);
    if (emailExists) {
      Get.snackbar(
        "User Already Registered",
        "Try logging in instead",
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: AppColors.remove,
        colorText: Colors.white,
      );
    } else {
      signUp();
    }
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

  void toLoginScreen() => Get.offAllNamed(loginModule.name);

  @override
  void onClose() {
    inputControls.disposeAll();
    super.onClose();
  }
}
