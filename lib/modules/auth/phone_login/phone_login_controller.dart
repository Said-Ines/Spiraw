import 'package:country_picker/country_picker.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';

import '../../../bases/models/input_control.dart';
import '../../../bases/screens/exports.dart';
import '../../all_modules.dart';
import 'phone_login_service.dart';

class PhoneLoginController extends GetxController {
  final countryPhoneCodeObs = Observable<Country?>(null);
  final phoneControl = InputControl.generate(1);
  final formKey = GlobalKey<FormState>();
  final performingApiCall = Observable(false);

  final phoneLoginService = Get.find<PhoneLoginService>();

  void loginWithPhone() async {
    if (!formKey.isValid) return;
    performingApiCall.toggle();
    final phoneNumber = "+${countryPhoneCodeObs.value?.phoneCode ?? "216"} ${phoneControl.first.controller.text}";
    final isUserRegistered = await phoneLoginService.isUserRegistered(phoneNumber);
    final userId = FirebaseAuth.instance.currentUser?.uid;

    if (isUserRegistered) {
      final isMachineAuthenticated = await phoneLoginService.isMachineRegisteredForUser(userId);

      isMachineAuthenticated
          ? Get.offAllNamed(
              addRecipeModule.name,
            )
          : Get.offAllNamed(getStartedModule.name);
    } else {
      phoneLoginService.verifyPhoneNumber(
          phoneNumber: phoneNumber,
          codeSent: (verificationId, resendToken) async {
            performingApiCall.toggle();
            Get.toNamed(
              otpModule.name,
              arguments: [phoneControl.first.controller.text, verificationId],
            );
          });
    }

    performingApiCall.toggle();
  }

  String getPhoneNumber() {
    return "+${countryPhoneCodeObs.value?.phoneCode ?? "216"} ${phoneControl.first.controller.text}";
  }

  MaskTextInputFormatter phoneInputsMaskFormatter() => MaskTextInputFormatter(
        mask: '## ### ###',
        filter: {'#': RegExp('[0-9]')},
        type: MaskAutoCompletionType.lazy,
      );

  @override
  void onClose() {
    phoneControl.disposeAll();
    super.onClose();
  }
}
