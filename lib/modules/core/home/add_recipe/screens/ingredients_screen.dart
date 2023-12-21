import '../../../../../bases/screens/exports.dart';
import '../../../../../widgets/back_button.dart';
import '../controllers/add_recipe_controller.dart';

class IngredientsScreen extends GetView<AddRecipeController> {
  const IngredientsScreen({super.key});

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
          const Gap(50),
          Text(
            "Ingredients",
            style: AppStyles.interSemiBoldTextButton.withColor(Colors.white).medium().withSize(FontSizes.headline2),
          ).align(alignment: Alignment.topLeft),
          const Gap(8),
          Text(
            "Put the neccesary ingredients",
            style: AppStyles.urbanistregularTitle.semiBold().withColor(AppColors.grey).withSize(FontSizes.headline4),
          ).align(alignment: Alignment.topLeft),
          const Gap(60),
          Row(
            children: [
              const GreenDot(),
              const Gap(16),
              Text(
                "Spirulina",
                style: AppStyles.rubikboldHeadline3.withSize(FontSizes.headline6).withColor(Colors.white),
              ),
              Gap(Get.height * 0.13),
              InkWell(
                overlayColor: MaterialStateProperty.all<Color>(AppColors.boxShadow),
                onTap: () {},
                child: Row(
                  children: [
                    Text(
                      "Add amount",
                      style: AppStyles.rubikregularTitle.medium().withColor(AppColors.secondary),
                    ),
                    const Gap(8),
                    const Icon(
                      Icons.arrow_forward_ios,
                      size: 18,
                      color: AppColors.secondary,
                    ),
                  ],
                ),
              ),
            ],
          ),
          Gap(Get.height * 0.37),
          StyledButton(style: ButtonStyles.ingredient, title: '+  Add ingredient', onPressed: () {})
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
                reversed: true,
                icon: const Icon(
                  Icons.arrow_forward_ios,
                  size: 20,
                ),
              ),
            ),
          ],
        ).paddingSymmetric(horizontal: AppConstants.bodyMinSymetricHorizontalPadding),
      ),
    );
  }
}

class GreenDot extends StatelessWidget {
  const GreenDot({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 18,
      width: 18,
      decoration: const BoxDecoration(
        color: AppColors.secondary,
        shape: BoxShape.circle,
      ),
    );
  }
}
