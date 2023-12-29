import '../../../../../bases/screens/exports.dart';
import '../../../../../widgets/back_button.dart';
import '../../../../../widgets/upload_button.dart';
import '../controllers/add_recipe_controller.dart';

class AddRecipeScreen extends GetView<AddRecipeController> {
  const AddRecipeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SmartScaffold(
      body: ScrollableForm(
        formKey: controller.formKey,
        children: [
          Row(
            children: [
              const BackButton(),
              const Gap(16),
              Text(
                "Add Recipe",
                style: AppStyles.interboldHeadline3.withSize(FontSizes.headline2).withColor(Colors.white),
              ),
            ],
          ),
          const Gap(50),
          Text(
            "Title",
            style: AppStyles.interregularTitle.withColor(Colors.white).withSize(FontSizes.headline4).medium(),
          ).align(alignment: Alignment.topLeft),
          const Gap(20),
          FormInput(
            type: FormInputType.normal,
            hint: "Spirulina cake",
            controller: controller.inputControls.first.controller,
            keyboardType: TextInputType.text,
            validator: InputValidators.validateRecipeName,
            fillColor: AppColors.inputColor,
          ),
          const Gap(36),
          Text(
            "Add image",
            style: AppStyles.interregularTitle.withColor(Colors.white).withSize(FontSizes.headline4).medium(),
          ).align(alignment: Alignment.topLeft),
          const Gap(20),
          const UploadButton(),
          const Gap(36),
          Text(
            "Description",
            style: AppStyles.interregularTitle.withColor(Colors.white).withSize(FontSizes.headline4).medium(),
          ).align(alignment: Alignment.topLeft),
          const Gap(20),
          FormInput(
            type: FormInputType.normal,
            hint: "My favorite spirulina recipe",
            controller: controller.inputControls.last.controller,
            keyboardType: TextInputType.text,
            validator: InputValidators.validateRecipeDescription,
            fillColor: AppColors.inputColor,
            isDescriptionField: true,
            expands: true,
            maxLines: null,
            minLines: null,
          ),
          const Gap(100),
          StyledButton(
            style: ButtonStyles.primary,
            title: "Next",
            onPressed: controller.addRecipeValidation,
            icon: const Icon(Icons.keyboard_arrow_right_outlined),
            isFromRecipe: true,
            reversed: true,
          ),
        ],
      ).paddingOnly(top: AppConstants.minBodyTopPadding),
    );
  }
}
