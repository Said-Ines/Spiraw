import '../../../bases/screens/exports.dart';
import '../auth/common/widgets/index.dart';
import 'ds_controller.dart';

class DesignSystemScreen extends GetView<DesignSystemController> {
  const DesignSystemScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SmartScaffold(
      displayAppBar: false,
      displayMenu: false,
      body: ScrollableForm(
          formKey: controller.formKey,
          topPadding: 35,
          bottomPadding: 135,
          children: [
            const VerticalSpacing(20),
            Text(
              "Username",
              style: AppStyles.interregularTitle
                  .withColor(AppColors.grey)
                  .medium(),
            ).align(alignment: Alignment.topLeft),
            const VerticalSpacing(12),
            FormInput(
              type: FormInputType.normal,
              //label: "Email",
              hint: "Enter username",
              controller: controller.inputControls.first.controller,
              keyboardType: TextInputType.emailAddress,
              validator: InputValidators.validateUsername,
              fillColor: AppColors.inputColor,
            ),
            const VerticalSpacing(24),
            Text(
              "Email",
              style: AppStyles.interregularTitle
                  .withColor(AppColors.grey)
                  .medium(),
            ).align(alignment: Alignment.topLeft),
            const VerticalSpacing(12),
            FormInput(
              type: FormInputType.normal,
              //label: "Email",
              hint: "Enter email",
              controller: controller.inputControls.first.controller,
              keyboardType: TextInputType.emailAddress,
              validator: InputValidators.validateEmail,
              fillColor: AppColors.inputColor,
            ),
            const VerticalSpacing(24),
            Text(
              "Password",
              style: AppStyles.interregularTitle
                  .withColor(AppColors.grey)
                  .medium(),
            ).align(alignment: Alignment.topLeft),
            const VerticalSpacing(12),
            FormInput(
              type: FormInputType.password,
              // label: "Password",
              hint: "Enter password",
              hintColor: AppColors.hint,
              controller: controller.inputControls.second.controller,
              validator: InputValidators.validatePassword,
              fillColor: AppColors.inputColor,
            ),
            const VerticalSpacing(24),
            Text(
              "Confirm password",
              style: AppStyles.interregularTitle
                  .withColor(AppColors.grey)
                  .medium(),
            ).align(alignment: Alignment.topLeft),
            const VerticalSpacing(12),
            FormInput(
              type: FormInputType.password,
              // label: "Password",
              hint: "Enter password again",
              hintColor: AppColors.hint,
              controller: controller.inputControls.second.controller,
              validator: InputValidators.validatePassword,
              fillColor: AppColors.inputColor,
            ),
            const VerticalSpacing(8),
            LinkTextButton(
              title: "Forgot password ?",
              onTap: () {
                debugPrint("forgot password");
              },
            ).align(alignment: Alignment.bottomRight)
          ]),
    );
  }
}
