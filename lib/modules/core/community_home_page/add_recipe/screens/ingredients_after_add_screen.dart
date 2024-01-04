import '../../../../../bases/screens/exports.dart';
import '../../../../../widgets/back_button.dart';
import '../../data/models/ingredient_model.dart';
import '../controllers/add_recipe_controller.dart';

class IngredientsAfterAddScreen extends GetView<AddRecipeController> {
  const IngredientsAfterAddScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SmartScaffold(
      body: SingleChildScrollView(
        child: Column(
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
                const _ColorfulDot(
                  isSpirulina: true,
                ),
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
            Obx(() {
              final List<IngredientModel> ingredients = controller.ingredients;
              if (ingredients.isEmpty) {
                return Container();
              }
              return ListView.builder(
                  shrinkWrap: true,
                  itemCount: ingredients.length,
                  itemBuilder: (context, index) {
                    final ingredient = ingredients[index];
                    return IngredientAdded(
                        elementName: ingredient.elementName,
                        servingSize: ingredient.servingSize,
                        quantity: ingredient.quantity,
                        removeAction: () {
                          controller.removeIngredient(index);
                        });
                  });
            }),
          ],
        ).paddingSymmetric(
          vertical: AppConstants.minBodyTopPadding,
          horizontal: AppConstants.bodyMinSymetricHorizontalPadding,
        ),
      ),
      floatingActionButton: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          StyledButton(
            style: ButtonStyles.ingredient,
            title: '+  Add ingredient',
            onPressed: controller.toAddIngredientsScreen,
          ).paddingSymmetric(horizontal: AppConstants.bodyMinSymetricHorizontalPadding),
          Container(
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
                    title: "Finish ",
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
        ],
      ),
    );
  }
}

class _ColorfulDot extends StatelessWidget {
  const _ColorfulDot({super.key, required this.isSpirulina});

  final bool isSpirulina;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 18,
      width: 18,
      decoration: BoxDecoration(
        color: isSpirulina ? AppColors.secondary : AppColors.blueDot,
        shape: BoxShape.circle,
      ),
    );
  }
}

class IngredientAdded extends StatelessWidget {
  const IngredientAdded({
    super.key,
    required this.elementName,
    required this.servingSize,
    required this.quantity,
    required this.removeAction,
  });

  final String elementName;
  final String servingSize;
  final int quantity;

  final VoidCallback removeAction;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const _ColorfulDot(isSpirulina: false),
        const Gap(16),
        Text(
          elementName,
          style: AppStyles.interSemiBoldTextButton.medium().withColor(Colors.white).withSize(FontSizes.headline6),
        ),
        const Spacer(),
        Text(
          "$quantity ",
          style: AppStyles.interSemiBoldTextButton.medium().withColor(Colors.white).withSize(FontSizes.headline6),
        ),
        Text(
          servingSize,
          style: AppStyles.interSemiBoldTextButton.medium().withColor(Colors.white).withSize(FontSizes.headline6),
        ),
        IconButton(
          onPressed: removeAction,
          icon: Image.asset(
            AppImages.removeIcon,
            width: 25,
            height: 25,
          ),
        )
      ],
    );
  }
}
