import '../../../bases/controllers/exports.dart';

class UserInfoController extends GetxController {
  final performingApiCall = Observable(false);

  final inputControls = InputControl.generate(3);
  final formKey = GlobalKey<FormState>();

  void userValidate() {
    if (!formKey.isValid) return;
  }

  Future<void> login() async {
    performingApiCall.toggle();
    await 2.delay();
    performingApiCall.toggle();
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
