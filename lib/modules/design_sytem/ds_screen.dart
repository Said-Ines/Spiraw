import '../../../bases/screens/exports.dart';
import '../auth/common/widgets/index.dart';
import 'ds_controller.dart';

class DesignSystemScreen extends GetView<DesignSystemController> {
  const DesignSystemScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SmartScaffold(
      displayMenu: false,
      body: ScrollableForm(
          formKey: controller.formKey,
          topPadding: 35,
          bottomPadding: 135,
          children: [
            const VerticalSpacing(20),
            FormInput(
              type: FormInputType.normal,
              label: "Email",
              hint: "Enter email",
              controller: controller.inputControls.first.controller,
              keyboardType: TextInputType.emailAddress,
              validator: InputValidators.validateEmail,
            ),
            const VerticalSpacing(20),
            FormInput(
              type: FormInputType.password,
              label: "Password",
              hint: "Enter password",
              controller: controller.inputControls.second.controller,
              validator: InputValidators.validatePassword,
            ),
            const VerticalSpacing(20),
            LinkTextButton(
              title: "Forgot password ?",
              onTap: () {
                debugPrint("forgot password");
              },
            )
          ]),
    );
  }
}
