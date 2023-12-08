import 'dart:math';

import 'package:flutter/services.dart';
import 'package:pin_code_fields/pin_code_fields.dart';

import '../../../bases/screens/exports.dart';
import '../../widgets/back_button.dart';
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
              "Hello! Register to get started",
              style: AppStyles.interboldHeadline1
                  .withSize(FontSizes.headline2)
                  .withColor(Colors.white),
            ),
            const VerticalSpacing(48),
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
                style: ButtonStyles.primary,
                title: "Register",
                onPressed: controller.login,
              ),
            ),
            const VerticalSpacing(20),
            Observer(
              observes: controller.performingApiCall,
              builder: (context, performingApiCall) => StyledButton(
                isLoading: performingApiCall,
                isDisabled: true,
                style: ButtonStyles.primary,
                title: "Register",
                onPressed: controller.login,
              ),
            ),
            const VerticalSpacing(20),
            Observer(
              observes: controller.performingApiCall,
              builder: (context, performingApiCall) => StyledButton(
                isLoading: performingApiCall,
                style: ButtonStyles.secondary,
                title: "Order Spiraw",
                onPressed: controller.login,
              ),
            ),
            const VerticalSpacing(20),
            Observer(
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
            const VerticalSpacing(20),
            PinCodeTextField(
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
                  borderRadius:
                      BorderRadius.circular(AppConstants.inputs.radius),
                  fieldHeight: 63,
                  fieldWidth: 70,
                  inactiveColor: AppColors.inputColor,
                  selectedColor: AppColors.secondary,
                  activeFillColor: AppColors.inputColor,
                  inactiveFillColor: AppColors.inputColor,
                  selectedFillColor: AppColors.inputColor),
              textStyle: AppStyles.interboldHeadline1
                  .withSize(FontSizes.headline2)
                  .withColor(Colors.white),
            ),
            const VerticalSpacing(20),
            const BackButton(),
            const VerticalSpacing(20),
            Transform(
                transform: Matrix4.identity()..rotateZ(pi / 4),
                alignment: Alignment.center,
                child: Container(
                  decoration: BoxDecoration(boxShadow: [
                    BoxShadow(
                      color: AppColors.secondary.withOpacity(0.45),
                      offset: const Offset(2, 5),
                      blurRadius: 15,
                    )
                  ]),
                  child: FloatingActionButton(
                    elevation: 0,
                    backgroundColor: AppColors.secondary,
                    onPressed: () {},
                    child: Transform(
                      transform: Matrix4.identity()..rotateZ(-pi / 4),
                      alignment: Alignment.center,
                      child: Icon(
                        Icons.arrow_back,
                        size: AppConstants.buttons.floating.iconSize + 13,
                        color: AppColors.inputColor,
                      ),
                    ),
                  ),
                ))
          ]),
    );
  }
}
