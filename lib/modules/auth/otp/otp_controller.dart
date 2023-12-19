import '../../../bases/controllers/exports.dart';
import 'otp_service.dart';

class OtpController extends GetxController {
  static List arguments = Get.arguments;
  final String phoneNumber = arguments.first ?? "------";
  final String verificationId = Get.arguments[1];
  final otpService = Get.find<OtpService>();

  final performingApiCall = Observable(false);
  final observables = List.generate(6, (index) => Observable<bool>(index.isOdd));

  final inputControls = InputControl.generate(1);
  final formKey = GlobalKey<FormState>();

  void otpValidation() {
    if (!formKey.isValid) return;
    performingApiCall.toggle();
    final smsCode = inputControls.first.controller.text.trim();
    Debugger.green(smsCode);

    otpService
        .loginWithSmsCode(smsCode, verificationId)
        .then((value) => {performingApiCall.toggle(), Get.offNamed(userInfoModule.name)});
  }

  void resendOtpCode() {}

  @override
  void onClose() {
    inputControls.disposeAll();
    super.onClose();
  }
}
