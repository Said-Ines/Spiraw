import '../../../../../bases/screens/exports.dart';
import '../../../../../widgets/back_button.dart';
import '../../../../../widgets/drop_down_button_section.dart';
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
                      onPressed: () {
                        if (controller.preparationTime.value > 1) {
                          controller.preparationTime--;
                        }
                      },
                      icon: Image.asset(
                        AppImages.minusIcon,
                        height: 15,
                        width: 15,
                      ))),
              const Gap(20),
              Obx(() => Text(
                    "${controller.preparationTime.value} Mins",
                    style: AppStyles.rubikboldHeadline3.withColor(Colors.white).withSize(FontSizes.headline2),
                  )),
              const Gap(20),
              Container(
                  height: 40,
                  width: 40,
                  decoration: const BoxDecoration(
                    color: AppColors.offWhite,
                    borderRadius: BorderRadius.all(Radius.circular(12)),
                  ),
                  child: IconButton(
                      onPressed: () {
                        controller.preparationTime.value++;
                      },
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
                      onPressed: () {
                        if (controller.cookingTime.value > 1) {
                          controller.cookingTime--;
                        }
                      },
                      icon: Image.asset(
                        AppImages.minusIcon,
                        height: 15,
                        width: 15,
                      ))),
              const Gap(20),
              Obx(() => Text(
                    "${controller.cookingTime.value} Mins",
                    style: AppStyles.rubikboldHeadline3.withColor(Colors.white).withSize(FontSizes.headline2),
                  )),
              const Gap(20),
              Container(
                  height: 40,
                  width: 40,
                  decoration: const BoxDecoration(
                    color: AppColors.offWhite,
                    borderRadius: BorderRadius.all(Radius.circular(12)),
                  ),
                  child: IconButton(
                      onPressed: () {
                        controller.cookingTime.value++;
                      },
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
          Obx(() => DropDownButtonSection(
                onChanged: controller.updateSelectedDifficulty,
                value: controller.selectedDifficulty.value,
                itemsList: controller.difficultyOptions,
              ))
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
