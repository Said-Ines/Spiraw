import '../../../../../bases/screens/exports.dart';
import '../../../../../widgets/back_button.dart';
import '../../../../../widgets/category_card.dart';
import '../controllers/add_recipe_controller.dart';

class RecipeCategoriesScreen extends GetView<AddRecipeController> {
  const RecipeCategoriesScreen({super.key});

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
          const Gap(45),
          Text(
            "Categories",
            style: AppStyles.interregularTitle.withColor(Colors.white).withSize(FontSizes.headline4).medium(),
          ).align(alignment: Alignment.topLeft),
          const Gap(20),
          FormInput(
            type: FormInputType.normal,
            hint: "Select a category",
            controller: controller.inputControls.first.controller,
            keyboardType: TextInputType.text,
            validator: InputValidators.validateRecipeName,
            fillColor: AppColors.inputColor,
          ),
          const Gap(36),
          GridView.count(
            crossAxisCount: 2,
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            children: List.generate(6, (index) {
              return CategoryCard(image: controller.categories[index].image, title: controller.categories[index].title)
                  .paddingAll(12);
            }),
          ),
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
