import '../../../bases/models/input_control.dart';
import '../../../bases/screens/exports.dart';
import '../../all_modules.dart';

class LoginController extends GetxController {
  final inputControls = InputControl.generate(2);
  final formKey = GlobalKey<FormState>();
  final performingApiCall = Observable(false);

  void toSignUp() {
    formKey.isValid;
  }

  Future<void> login() async {
    performingApiCall.toggle();
    await 2.delay();
    performingApiCall.toggle();
  }

  void toSignUpModule() => Get.offNamed(signupModule.name);

  @override
  void onClose() {
    inputControls.disposeAll();
    super.onClose();
  }
}
