import 'dart:math';

import 'package:flutter/services.dart';
import 'package:pin_code_fields/pin_code_fields.dart';

import '../../../bases/screens/exports.dart';
import '../../widgets/back_button.dart';
import '../../widgets/bottom_bars/rounded_bottom_bar.dart';
import '../../widgets/upload_button.dart';
import '../auth/common/widgets/index.dart';
import 'ds_controller.dart';

class DesignSystemScreen extends GetView<DesignSystemController> {
  const DesignSystemScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SmartScaffold(
      body: ScrollableForm(formKey: controller.formKey, topPadding: 35, bottomPadding: 135, children: [
        const VerticalSpacing(20),
        Text(
          "Hello! Register to get started",
          style: AppStyles.interboldHeadline1.withSize(FontSizes.headline2).withColor(Colors.white),
        ),
        const VerticalSpacing(48),
        Text(
          "Username",
          style: AppStyles.interregularTitle.withColor(AppColors.grey).medium(),
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
          style: AppStyles.interregularTitle.withColor(AppColors.grey).medium(),
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
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Expanded(child: Divider(color: Colors.white, thickness: AppConstants.dividerThickness)),
            Text("Or login with", style: AppStyles.interregularSubTitle.withColor(AppColors.greenLighter))
                .paddingSymmetric(horizontal: 5),
            const Expanded(
                child: Divider(
              color: Colors.white,
              thickness: AppConstants.dividerThickness,
            ))
          ],
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
              borderRadius: BorderRadius.circular(AppConstants.inputs.radius),
              fieldHeight: 63,
              fieldWidth: 70,
              inactiveColor: AppColors.inputColor,
              selectedColor: AppColors.secondary,
              activeFillColor: AppColors.inputColor,
              inactiveFillColor: AppColors.inputColor,
              selectedFillColor: AppColors.inputColor),
          textStyle: AppStyles.interboldHeadline1.withSize(FontSizes.headline2).withColor(Colors.white),
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
                    size: AppConstants.buttons.floating.iconSize,
                    color: AppColors.inputColor,
                  ),
                ),
              ),
            )),
        const VerticalSpacing(20),
        RoundedBottomBar(
          onPressed: () {},
        ),
        const VerticalSpacing(20),
        Observer(
          observes: controller.performingApiCall,
          builder: (context, performingApiCall) => StyledButton(
            isLoading: performingApiCall,
            style: ButtonStyles.primary,
            title: "Next",
            onPressed: () {},
            icon: const Icon(Icons.keyboard_arrow_right_outlined),
            isFromRecipe: true,
            reversed: true,
          ),
        ),
        const VerticalSpacing(20),
        const UploadButton(),
        const VerticalSpacing(20),
        Container(
          height: AppConstants.gradientBottomBar.gradientBottomBarHeight,
          width: AppConstants.gradientBottomBar.gradientBottomBarWeight,
          decoration: BoxDecoration(
              gradient: AppColors.scanningOptionsGradientBox,
              borderRadius: BorderRadius.all(Radius.circular(AppConstants.gradientBottomBar.radius)),
              border: Border.all(color: AppColors.gradientBarBorderClr, width: 2)),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              IconButton(
                onPressed: () {},
                icon: Image.asset(
                  AppImages.galleryIcon,
                  width: AppConstants.gradientBottomBar.iconSize,
                  height: AppConstants.gradientBottomBar.iconSize,
                ),
              ),
              IconButton(
                onPressed: () {},
                icon: Image.asset(
                  AppImages.flashIcon,
                  width: AppConstants.gradientBottomBar.iconSize,
                  height: AppConstants.gradientBottomBar.iconSize,
                ),
              ),
              IconButton(
                onPressed: () {},
                icon: Image.asset(
                  AppImages.switchCameraIcon,
                  width: AppConstants.gradientBottomBar.iconSize - 10,
                  height: AppConstants.gradientBottomBar.iconSize - 10,
                ),
              ),
            ],
          ).symmetricPadding(horizontal: 15),
        )
      ]),
    );
  }
}
