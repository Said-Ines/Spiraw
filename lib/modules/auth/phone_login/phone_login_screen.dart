import 'package:country_picker/country_picker.dart';
import 'package:gap/gap.dart';

import '../../../bases/screens/exports.dart';
import '../../../widgets/logo.dart';
import '../common/widgets/terms_and_conditions.dart';
import 'phone_login_controller.dart';

class PhoneLoginScreen extends GetView<PhoneLoginController> {
  const PhoneLoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SmartScaffold(
      displayAppBar: false,
      backgroundColor: AppColors.primary,
      body: ScrollableForm(
        formKey: controller.formKey,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Gap(Get.height * 0.06),
          const Center(child: Logo()),
          const Gap(AppConstants.maxBodyTopPadding),
          Align(
            alignment: Alignment.centerLeft,
            child: Text(
              "Enter your mobile number",
              style: AppStyles.interregularTitle,
            ),
          ),
          const Gap(6),
          Container(
              decoration: BoxDecoration(
                color: AppColors.inputColor,
                borderRadius: BorderRadius.circular(AppConstants.inputs.radius),
              ),
              child: const _CountryPhoneInput()),
          const Gap(48),
          StyledButton(
            style: ButtonStyles.primary,
            title: "Continue",
            onPressed: controller.toOtpValidation,
          ),
        ],
      ),
      floatingActionButton: const TermsAndConditionsAgreeingWidget().paddingOnly(bottom: 30),
    );
  }
}

class _CountryPhoneInput extends GetView<PhoneLoginController> {
  const _CountryPhoneInput();

  @override
  Widget build(BuildContext context) {
    return FormInput(
      controller: controller.phoneControl.first.controller,
      type: FormInputType.normal,
      theme: InputTheme.dark,
      keyboardType: TextInputType.number,
      hint: "-- --- ---",
      hintColor: AppColors.greyRegular,
      inputFormatters: [controller.phoneInputsMaskFormatter()],
      validator: InputValidators.validatePhone,
      prefixIcon: InkWell(
        onTap: () {
          showCountryPicker(
            favorite: ["TN"],
            context: context,
            showPhoneCode: true,
            searchAutofocus: true,
            useSafeArea: true,
            countryListTheme: CountryListThemeData(
              bottomSheetHeight: Get.height * .8,
              flagSize: 28,
              padding: const EdgeInsets.all(AppConstants.bodyMinSymetricHorizontalPadding),
              backgroundColor: AppColors.inputColor.withOpacity(.9),
              searchTextStyle: AppFonts.inter.regular().withSize(FontSizes.title).withColor(Colors.white),
              textStyle: AppFonts.inter.regular().withSize(FontSizes.title).withColor(Colors.white),
              inputDecoration: InputDecoration(
                prefixIconColor: Colors.white,
                label: const Text("Type to search"),
                labelStyle: const TextStyle(color: AppColors.greyRegular),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(AppConstants.inputs.radius)),
                  borderSide: const BorderSide(color: AppColors.grey),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(AppConstants.inputs.radius)),
                  borderSide: const BorderSide(color: AppColors.grey),
                ),
              ),
            ),
            onSelect: (Country country) {
              controller.countyPhoneCodeObs.value = country;
            },
          );
        },
        child: Observer(
            observes: controller.countyPhoneCodeObs,
            builder: (context, Country? countryPhoneCode) {
              return Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    countryPhoneCode?.flagEmoji ?? "🇹🇳",
                    style: const TextStyle(fontSize: 30),
                  ).customPadding(left: 10),
                  const Icon(
                    Icons.arrow_drop_down_rounded,
                    size: 30,
                    color: AppColors.inputBorder,
                  ),
                  Text(
                    "+${countryPhoneCode?.phoneCode ?? 216}",
                    style: AppStyles.interregularTitle,
                  ).customPadding(left: 6, right: 12),
                ],
              ).symmetricPadding(vertical: 8);
            }),
      ).makeFitted(),
    );
  }
}
