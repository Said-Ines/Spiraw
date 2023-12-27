import '../../../bases/screens/exports.dart';
import '../common/widgets/index.dart';
import 'signup_controller.dart';

class SignUpScreen extends GetView<SignUpController> {
  const SignUpScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SmartScaffold(
      displayAppBar: false,
      body: ScrollableForm(children: [
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
          controller: controller.inputControls.first.controller,
          keyboardType: TextInputType.emailAddress,
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
          hintColor: AppColors.hint,
          controller: controller.inputControls.second.controller,
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
          hintColor: AppColors.hint,
          controller: controller.inputControls.second.controller,
          validator: InputValidators.validatePassword,
          fillColor: AppColors.inputColor,
        ),
        const VerticalSpacing(24),
        StyledButton(
          isDisabled: true,
          style: ButtonStyles.primary,
          title: "Register",
          onPressed: controller.signUp,
        ).paddingOnly(bottom: 48),
        Row(
          children: [
            Text(
              "Already have an account ? ",
              style: AppStyles.interregularTitle,
            ),
            LinkTextButton(
              title: "Login Now",
              onTap: () {},
              isRegister: true,
            )
          ],
        ).paddingSymmetric(horizontal: 20)
      ]),
    );
  }
}
