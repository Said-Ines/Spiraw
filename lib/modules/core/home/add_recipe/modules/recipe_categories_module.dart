import '../../../../../bases/screens/exports.dart';
import '../controllers/add_recipe_controller.dart';
import '../screens/recipe_categories_screen.dart';

final recipeCategoriesModule = GetPage(
  name: '/recipeCategoriesModule',
  page: () => const RecipeCategoriesScreen(),
  binding: BindingsBuilder.put(() => AddRecipeController()),
);
