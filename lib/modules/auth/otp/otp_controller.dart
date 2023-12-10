import '../../../bases/controllers/exports.dart';

class OtpController extends GetxController {
  final String phoneNumber = Get.arguments ?? "------";

  final performingApiCall = Observable(false);
  final observables = List.generate(4, (index) => Observable<bool>(index.isOdd));
  final inputControls = InputControl.generate(4);
  final formKey = GlobalKey<FormState>();

  void otpValidation() {
    if (!formKey.isValid) return;
    // Get.offNamed(userInfoModule.name);
  }

  void resendOtpCode() {}

  @override
  void onClose() {
    inputControls.disposeAll();
    super.onClose();
  }
}
