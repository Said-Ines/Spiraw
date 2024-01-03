import 'package:auto_size_text/auto_size_text.dart';

import '../../../bases/screens/exports.dart';
import '../common/widgets/index.dart';
import 'signup_controller.dart';

class SignUpScreen extends GetView<SignUpController> {
  const SignUpScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SmartScaffold(
      body: ScrollableForm(
        formKey: controller.formKey,
        children: [
          Text(
            "Hello! Register to get started",
            style: AppStyles.interboldHeadline1.withSize(FontSizes.headline2).withColor(Colors.white),
          ).paddingOnly(bottom: 48),
          Text(
            "Username",
            style: AppStyles.interregularTitle.withColor(AppColors.grey).medium(),
          ).align(alignment: Alignment.topLeft),
          const VerticalSpacing(12),
          FormInput(
            type: FormInputType.normal,
            hint: "Enter username",
            controller: controller.inputControls.first.controller,
            keyboardType: TextInputType.emailAddress,
            onChanged: (_) {
              controller.updateFormValidity();
            },
            validator: InputValidators.validateUsername,
            fillColor: AppColors.inputColor,
          ),
          const VerticalSpacing(24),
          Text(
            "Email",
            style: AppStyles.interregularTitle.withColor(AppColors.grey).medium(),
          ).align(alignment: Alignment.topLeft),
          const VerticalSpacing(12),
          FormInput(
            type: FormInputType.normal,
            hint: "Enter email",
            controller: controller.inputControls.second.controller,
            keyboardType: TextInputType.emailAddress,
            onChanged: (_) {
              controller.updateFormValidity();
            },
            validator: InputValidators.validateEmail,
            fillColor: AppColors.inputColor,
          ),
          const VerticalSpacing(24),
          Text(
            "Password",
            style: AppStyles.interregularTitle.withColor(AppColors.grey).medium(),
          ).align(alignment: Alignment.topLeft),
          const VerticalSpacing(12),
          FormInput(
            type: FormInputType.password,
            hint: "Enter password",
            controller: controller.inputControls[2].controller,
            onChanged: (_) {
              controller.updateFormValidity();
            },
            validator: InputValidators.validatePassword,
            fillColor: AppColors.inputColor,
          ),
          const VerticalSpacing(24),
          Text(
            "Confirm password",
            style: AppStyles.interregularTitle.withColor(AppColors.grey).medium(),
          ).align(alignment: Alignment.topLeft),
          const VerticalSpacing(12),
          FormInput(
            type: FormInputType.password,
            hint: "Enter password again",
            controller: controller.inputControls.last.controller,
            onChanged: (_) {
              controller.updateFormValidity();
            },
            validator: (value) {
              return InputValidators.validatePasswordConfirmation(
                value,
                password: controller.inputControls[2].controller.text,
              );
            },
            fillColor: AppColors.inputColor,
          ),
          const VerticalSpacing(24),
          Observer(
              observes: controller.isActive,
              builder: (context, isActive) {
                return StyledButton(
                  isDisabled: !isActive,
                  style: isActive ? ButtonStyles.primary : ButtonStyles.inactif,
                  title: "Register",
                  onPressed: controller.signUp,
                ).paddingOnly(bottom: 48);
              }),
          Row(
            children: [
              AutoSizeText(
                "Already have an account ? ",
                style: AppStyles.interregularTitle,
              ),
              LinkTextButton(
                title: "Login Now",
                onTap: controller.toLoginScreen,
                isRegister: true,
              )
            ],
          ).paddingSymmetric(horizontal: 10)
        ],
      ).paddingOnly(top: AppConstants.minBodyTopPadding),
    );
  }
}
