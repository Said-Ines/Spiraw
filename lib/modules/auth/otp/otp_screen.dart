library otp_screen;

import 'package:flutter/services.dart';
import 'package:gap/gap.dart';
import 'package:pin_code_fields/pin_code_fields.dart';
import 'package:spiraw/modules/auth/otp/otp_controller.dart';

import '../../../bases/screens/exports.dart';
import '../../../widgets/back_button.dart';

class OtpScreen extends GetView<OtpController> {
  const OtpScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SmartScaffold(
        body: ScrollableForm(topPadding: AppConstants.minBodyTopPadding, children: [
      const BackButton(),
      const Gap(16),
      Text(
        "Verification Code",
        style: AppStyles.interboldHeadline1.withSize(FontSizes.headline2).withColor(Colors.white),
      ).align(alignment: Alignment.topLeft),
      const Gap(16),
      Text(
        "Enter the verification code we just sent on your email address.",
        style: AppStyles.interregularTitle.withColor(Colors.white).medium(),
      ).align(alignment: Alignment.topLeft),
      const Gap(48),
      const _PinInput(),
      const Gap(48),
      Observer(
        observes: controller.performingApiCall,
        builder: (context, performingApiCall) => StyledButton(
          isLoading: performingApiCall,
          isDisabled: true,
          style: ButtonStyles.primary,
          title: "Verify account",
          onPressed: controller.otpValidation,
        ),
      ),
    ]));
  }
}

class _PinInput extends StatelessWidget {
  const _PinInput();

  @override
  Widget build(BuildContext context) {
    return PinCodeTextField(
      validator: InputValidators.validateSMSCode,
      errorTextMargin: const EdgeInsets.only(top: 60),
      appContext: context,
      length: 4,
      keyboardType: TextInputType.phone,
      inputFormatters: [FilteringTextInputFormatter.digitsOnly],
      cursorColor: AppColors.offWhite,
      enableActiveFill: true,
      pinTheme: PinTheme(
          shape: PinCodeFieldShape.box,
          borderRadius: BorderRadius.circular(AppConstants.inputs.radius),
          fieldHeight: 63,
          fieldWidth: 70,
          inactiveColor: AppColors.inputColor,
          selectedColor: AppColors.secondary,
          activeFillColor: AppColors.inputColor,
          inactiveFillColor: AppColors.inputColor,
          selectedFillColor: AppColors.inputColor),
      textStyle: AppStyles.interboldHeadline1.withSize(FontSizes.headline2).withColor(Colors.white),
    );
  }
}
