import '../../../../../bases/screens/exports.dart';
import '../../../../../widgets/back_button.dart';
import '../controllers/add_recipe_controller.dart';

class TimeSpentScreen extends GetView<AddRecipeController> {
  const TimeSpentScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SmartScaffold(
      body: ScrollableForm(
        children: [
          Row(
            children: [
              const BackButton(),
              const Gap(16),
              Text(
                "Add Recipe",
                style: AppStyles.urbanistboldHeadline3.withSize(FontSizes.headline2).withColor(Colors.white),
              ),
            ],
          ),
          const Gap(70),
          Text(
            "Time Spent",
            style: AppStyles.interSemiBoldTextButton.withColor(Colors.white).medium().withSize(FontSizes.headline2),
          ).align(alignment: Alignment.topLeft),
          const Gap(20),
          Text(
            "Preparation",
            style: AppStyles.urbanistregularTitle.semiBold().withColor(AppColors.grey).withSize(FontSizes.headline4),
          ).align(alignment: Alignment.topLeft),
          const Gap(20),
          Row(
            children: [
              Container(
                  height: 40,
                  width: 40,
                  decoration: const BoxDecoration(
                    color: AppColors.offWhite,
                    borderRadius: BorderRadius.all(Radius.circular(12)),
                  ),
                  child: IconButton(
                      onPressed: () {},
                      icon: Image.asset(
                        AppImages.minusIcon,
                        height: 15,
                        width: 15,
                      ))),
              const Gap(20),
              Text(
                "5 Mins",
                style: AppStyles.rubikboldHeadline3.withColor(Colors.white).withSize(FontSizes.headline2),
              ),
              const Gap(20),
              Container(
                  height: 40,
                  width: 40,
                  decoration: const BoxDecoration(
                    color: AppColors.offWhite,
                    borderRadius: BorderRadius.all(Radius.circular(12)),
                  ),
                  child: IconButton(
                      onPressed: () {},
                      icon: Image.asset(
                        AppImages.plusIcon,
                        height: 20,
                        width: 20,
                      )))
            ],
          ),
          const Gap(24),
          Text(
            "Cooking",
            style: AppStyles.urbanistregularTitle.semiBold().withColor(AppColors.grey).withSize(FontSizes.headline4),
          ).align(alignment: Alignment.topLeft),
          const Gap(20),
          Row(
            children: [
              Container(
                  height: 40,
                  width: 40,
                  decoration: const BoxDecoration(
                    color: AppColors.offWhite,
                    borderRadius: BorderRadius.all(Radius.circular(12)),
                  ),
                  child: IconButton(
                      onPressed: () {},
                      icon: Image.asset(
                        AppImages.minusIcon,
                        height: 15,
                        width: 15,
                      ))),
              const Gap(20),
              Text(
                "4 Mins",
                style: AppStyles.rubikboldHeadline3.withColor(Colors.white).withSize(FontSizes.headline2),
              ),
              const Gap(20),
              Container(
                  height: 40,
                  width: 40,
                  decoration: const BoxDecoration(
                    color: AppColors.offWhite,
                    borderRadius: BorderRadius.all(Radius.circular(12)),
                  ),
                  child: IconButton(
                      onPressed: () {},
                      icon: Image.asset(
                        AppImages.plusIcon,
                        height: 20,
                        width: 20,
                      )))
            ],
          ),
          const Gap(36),
          Text(
            "Difficulty",
            style: AppStyles.interSemiBoldTextButton.withColor(Colors.white).medium().withSize(FontSizes.headline2),
          ).align(alignment: Alignment.topLeft),
          const Gap(20),
          const DropDownButtonSection()
        ],
      ).paddingOnly(top: AppConstants.minBodyTopPadding),
      floatingActionButton: Container(
        height: 100,
        decoration: BoxDecoration(gradient: AppColors.categoriesBarGradient),
        child: Row(
          children: [
            const BackButton(
              fromMachineSetup: true,
            ),
            const Gap(24),
            Expanded(
              child: StyledButton(
                style: ButtonStyles.primary,
                title: "Next ",
                onPressed: () {},
                isFromRecipe: true,
                reversed: false,
              ),
            ),
          ],
        ).paddingSymmetric(horizontal: AppConstants.bodyMinSymetricHorizontalPadding),
      ),
    );
  }
}

class DropDownButtonSection extends GetView<AddRecipeController> {
  const DropDownButtonSection({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Obx(() => DropdownButtonHideUnderline(
        child: Container(
            height: 56,
            width: 350,
            decoration: BoxDecoration(
              color: AppColors.offWhite,
              border: Border.all(color: AppColors.inputColor, width: 2),
              borderRadius: BorderRadius.circular(
                AppConstants.inputs.radius,
              ),
            ),
            child: DropdownButton<String>(
              items: controller.difficultyOptions.map((String difficulty) {
                return DropdownMenuItem<String>(
                  value: difficulty,
                  child: Text(
                    difficulty,
                    style: AppStyles.rubikregularTitle.withSize(FontSizes.headline6).medium().withColor(AppColors.darkBackIcon),
                  ).paddingOnly(left: AppConstants.bodyMinSymetricHorizontalPadding),
                );
              }).toList(),
              onChanged: controller.updateSelectedDifficulty,
              value: controller.selectedDifficulty.value,
              dropdownColor: AppColors.offWhite,
              icon: Container(
                width: 56,
                height: 56,
                decoration: BoxDecoration(
                  color: AppColors.secondary,
                  border: Border.all(color: AppColors.inputColor, width: 2),
                  borderRadius: BorderRadius.only(
                    topRight: Radius.circular(AppConstants.inputs.radius),
                    bottomRight: Radius.circular(AppConstants.inputs.radius),
                  ),
                ),
                child: const Icon(
                  Icons.keyboard_arrow_down,
                  color: AppColors.offBlack,
                  size: 35,
                ),
              ),
            ))).paddingSymmetric(horizontal: AppConstants.bodyMinSymetricHorizontalPadding));
  }
}
