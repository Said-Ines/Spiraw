import '../../../../../bases/screens/exports.dart';
import '../controller/recipe_page_controller.dart';
import '../screen/recipe_page_screen.dart';

final recipePageModule = GetPage(
  name: '/recipePageModule',
  page: () => const RecipePageScreen(),
  binding: BindingsBuilder.put(() => RecipePageController()),
);
