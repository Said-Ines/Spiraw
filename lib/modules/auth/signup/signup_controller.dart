import '../../../bases/models/input_control.dart';
import '../../../bases/screens/exports.dart';
import '../../all_modules.dart';

class SignUpController extends GetxController {
  final inputControls = InputControl.generate(3);
  final formKey = GlobalKey<FormState>();

  void signUp() {
    if (formKey.isValid) return;
    Get.offNamed(splashModule.name);
  }

  void toLoginModule() => Get.offNamed(loginModule.name);

  @override
  void onClose() {
    inputControls.disposeAll();
    super.onClose();
  }
}
