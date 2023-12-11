import 'package:spiraw/modules/all_modules.dart';

import '../../../bases/controllers/exports.dart';

class UserInfoController extends GetxController {
  final performingApiCall = Observable(false);

  final inputControls = InputControl.generate(3);
  final formKey = GlobalKey<FormState>();

  void userValidate() async {
    if (!formKey.isValid) return;
    Get.offNamed(getStartedModule.name);
  }

  void back() {
    Get.back();
  }

  @override
  void onClose() {
    inputControls.disposeAll();

    super.onClose();
  }
}
