import '../bases/screens/exports.dart';
import '../modules/core/home/add_recipe/controllers/add_recipe_controller.dart';
import '../modules/core/home/data/models/category_info_model.dart';

class CategoryCard extends GetView<AddRecipeController> {
  const CategoryCard({
    Key? key,
    required this.image,
    required this.title,
    required this.category,
  }) : super(key: key);
  final String image;
  final String title;
  final CategoryInfo category;

  @override
  Widget build(BuildContext context) {
    return Obx(
      () {
        return InkWell(
          onTap: () {
            controller.deselectAllExcept(category);
            category.isSelected.toggle();
            controller.updateSelectedCategory(category);
          },
          child: Card(
            clipBehavior: Clip.antiAlias,
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(AppConstants.cardRadius),
                side: BorderSide(
                  color: category.isSelected.value ? AppColors.secondary : Colors.transparent,
                  width: 2,
                )),
            child: SizedBox(
              width: 160,
              height: 144,
              child: Stack(
                fit: StackFit.expand,
                children: [
                  Image.asset(
                    image,
                    fit: BoxFit.cover,
                  ),
                  Center(
                    child:
                        Text(title, style: AppStyles.urbanistboldHeadline3.withSize(FontSizes.headline4).withColor(Colors.white)),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
