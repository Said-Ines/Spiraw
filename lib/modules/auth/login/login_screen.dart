import '../../../bases/screens/exports.dart';
import '../common/widgets/index.dart';
import 'login_controller.dart';

class LoginScreen extends GetView<LoginController> {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SmartScaffold(
      
        body: ScrollableForm(
          children: [
            Text(
              "Welcome back! Glad to see you, again!",
              style: AppStyles.interboldHeadline1.withSize(FontSizes.headline2).withColor(Colors.white),
            ).paddingOnly(bottom: 48),
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
              // label: "Password",
              hint: "Enter password",
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
            ).align(alignment: Alignment.bottomRight),
            const VerticalSpacing(20),
            Observer(
              observes: controller.performingApiCall,
              builder: (context, performingApiCall) => StyledButton(
                isLoading: performingApiCall,
                isDisabled: true,
                style: ButtonStyles.primary,
                title: "Login",
                onPressed: controller.login,
              ),
            ),
            const VerticalSpacing(45),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Expanded(child: Divider(color: Colors.white.withOpacity(0.16), thickness: AppConstants.dividerThickness)),
                Text("Or login with", style: AppStyles.interregularSubTitle.withColor(AppColors.greenLighter))
                    .paddingSymmetric(horizontal: 5),
                Expanded(
                    child: Divider(
                  color: Colors.white.withOpacity(0.16),
                  thickness: AppConstants.dividerThickness,
                ))
              ],
            ),
            const VerticalSpacing(24),
            Row(
              children: [
                Expanded(
                  child: Observer(
                    observes: controller.performingApiCall,
                    builder: (context, performingApiCall) => StyledButton(
                      isLoading: performingApiCall,
                      style: ButtonStyles.social,
                      title: "Facebook",
                      onPressed: controller.login,
                      isSocial: true,
                      icon: Image.asset(
                        AppImages.facebookIcon,
                        height: 26,
                        width: 26,
                      ),
                    ),
                  ),
                ),
                const HorizontalSpacing(10),
                Expanded(
                  child: Observer(
                    observes: controller.performingApiCall,
                    builder: (context, performingApiCall) => StyledButton(
                      isLoading: performingApiCall,
                      style: ButtonStyles.social,
                      title: "Google",
                      onPressed: controller.login,
                      isSocial: true,
                      icon: Image.asset(
                        AppImages.googleIcon,
                        height: 26,
                        width: 26,
                      ),
                    ),
                  ),
                ),
              ],
            ),
            const VerticalSpacing(20),
            Row(
              children: [
                Text(
                  "Don't have an account ? ",
                  style: AppStyles.interregularTitle,
                ),
                LinkTextButton(
                  title: "Register Now",
                  onTap: () {},
                  isRegister: true,
                )
              ],
            ).paddingSymmetric(horizontal: 20)
          ],
        ));

  }

