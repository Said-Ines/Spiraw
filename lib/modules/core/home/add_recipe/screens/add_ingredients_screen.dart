import '../../../../../bases/screens/exports.dart';
import '../../../../../widgets/back_button.dart';
import '../../../../../widgets/drop_down_button_section.dart';
import '../controllers/add_recipe_controller.dart';

class AddIngredientsScreen extends GetView<AddRecipeController> {
  const AddIngredientsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SmartScaffold(
      body: ScrollableForm(children: [
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
        const Gap(50),
        Text(
          "Add Ingredients",
          style: AppStyles.interSemiBoldTextButton.withColor(Colors.white).medium().withSize(FontSizes.headline2),
        ).align(alignment: Alignment.topLeft),
        const Gap(30),
        Text(
          "Element's name",
          style: AppStyles.urbanistregularTitle.semiBold().withColor(AppColors.grey).withSize(FontSizes.headline4),
        ).align(alignment: Alignment.topLeft),
        const Gap(20),
        Container(
          decoration: BoxDecoration(
            border: Border.all(
              color: AppColors.offBlack,
              width: 2,
            ),
          ),
          child: const FormInput(
            type: FormInputType.normal,
            isSearchField: true,
            hintColor: AppColors.greyDarker,
            //label: "Email",
            hint: "Search",
            //controller: controller.inputControls.first.controller,
            keyboardType: TextInputType.emailAddress,
            //validator: InputValidators.validateUsername,
            fillColor: AppColors.offWhite,
            prefixIcon: Icon(
              Icons.search,
              color: AppColors.greyDarker,
              size: 24,
            ),
          ),
        ),
        const Gap(25),
        Text(
          "Serving",
          style: AppStyles.urbanistregularTitle.semiBold().withColor(AppColors.grey).withSize(FontSizes.headline4),
        ).align(alignment: Alignment.topLeft),
        const Gap(20),
        Obx(() => DropDownButtonSection(
              onChanged: controller.updateSelectedDifficulty,
              value: controller.selectedDifficulty.value,
              itemsList: controller.difficultyOptions,
            )),
        const Gap(25),
        Text(
          "Quantity",
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
                      if (controller.quantity.value > 1) {
                        controller.quantity--;
                      }
                    },
                    icon: Image.asset(
                      AppImages.minusIcon,
                      height: 15,
                      width: 15,
                    ))),
            const Gap(20),
            Obx(() => Text(
                  "${controller.quantity.value}",
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
                      controller.quantity.value++;
                    },
                    icon: Image.asset(
                      AppImages.plusIcon,
                      height: 20,
                      width: 20,
                    )))
          ],
        ),
      ]).paddingOnly(top: AppConstants.minBodyTopPadding),
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
                title: "Add ",
                onPressed: () {},
                isFromRecipe: true,
                reversed: true,
                icon: const Icon(
                  Icons.add,
                  size: 28,
                ),
              ),
            ),
          ],
        ).paddingSymmetric(horizontal: AppConstants.bodyMinSymetricHorizontalPadding),
      ),
    );
  }
}
