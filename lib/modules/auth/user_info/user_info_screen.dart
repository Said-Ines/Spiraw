import 'package:gap/gap.dart';
import 'package:spiraw/widgets/logo.dart';

import '../../../bases/screens/exports.dart';
import '../common/widgets/terms_and_conditions.dart';
import 'user_info_controller.dart';

class UserInfoScreen extends GetView<UserInfoController> {
  const UserInfoScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SmartScaffold(
      displayAppBar: false,
      body: ScrollableForm(formKey: controller.formKey, children: [
        const Logo().center(),
        const Gap(AppConstants.minBodyTopPadding),
        Text(
          "Tell us about you",
          style: AppStyles.interboldHeadline3.withSize(FontSizes.headline4).withColor(Colors.white),
        ),
        const Gap(10),
        Text(
          "Enter your preferred info below ",
          textAlign: TextAlign.center,
          style: AppStyles.interregularTitle,
        ),
        const Gap(40),
        Text(
          "First Name",
          style: AppStyles.interregularTitle.withColor(AppColors.grey).medium(),
        ).align(alignment: Alignment.topLeft),
        const Gap(12),
        const _FirstNameInput(),
        const Gap(24),
        Text(
          "Last Name",
          style: AppStyles.interregularTitle.withColor(AppColors.grey).medium(),
        ).align(alignment: Alignment.topLeft),
        const Gap(12),
        const _LastNameInput(),
        const Gap(24),
        Text(
          "Email",
          style: AppStyles.interregularTitle.withColor(AppColors.grey).medium(),
        ).align(alignment: Alignment.topLeft),
        const Gap(12),
        const _EmailInput(),
        const Gap(30),
        StyledButton(
          style: ButtonStyles.primary,
          title: "Next",
          onPressed: controller.userValidate,
          icon: const Icon(Icons.keyboard_arrow_right_outlined),
          isFromRecipe: true,
          reversed: true,
        ),
      ]),
      floatingActionButton: const TermsAndConditionsAgreeingWidget(),
    );
  }
}

class _FirstNameInput extends GetView<UserInfoController> {
  const _FirstNameInput({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return FormInput(
      hint: "Enter first name ",
      controller: controller.inputControls.first.controller,
      keyboardType: TextInputType.name,
      validator: InputValidators.validateFirstname,
      fillColor: AppColors.inputColor,
    );
  }
}

class _LastNameInput extends GetView<UserInfoController> {
  const _LastNameInput({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return FormInput(
      hint: "Enter last name",
      controller: controller.inputControls.second.controller,
      keyboardType: TextInputType.name,
      validator: InputValidators.validateLastname,
      fillColor: AppColors.inputColor,
    );
  }
}

class _EmailInput extends GetView<UserInfoController> {
  const _EmailInput({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return FormInput(
      hint: "Enter email",
      hintColor: AppColors.hint,
      controller: controller.inputControls.last.controller,
      validator: InputValidators.validateEmail,
      fillColor: AppColors.inputColor,
    );
  }
}
