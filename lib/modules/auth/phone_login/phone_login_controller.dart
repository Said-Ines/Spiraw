import 'package:country_picker/country_picker.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';

import '../../../bases/models/input_control.dart';
import '../../../bases/screens/exports.dart';
import '../otp/module/otp_module.dart';

class PhoneLoginController extends GetxController {
  final countyPhoneCodeObs = Observable<Country?>(null);
  final phoneControl = InputControl.generate(1);
  final formKey = GlobalKey<FormState>();

  void toOtpValidation() {
    if (!formKey.isValid) return;
    Get.toNamed(
      otpModule.name,
      arguments: phoneControl.first.controller.text,
    );
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
