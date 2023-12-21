import '../../../../../bases/screens/exports.dart';
import '../controllers/add_recipe_controller.dart';
import '../screens/ingredients_screen.dart';

final ingredientsModule = GetPage(
  name: '/ingredientsModule',
  page: () => const IngredientsScreen(),
  binding: BindingsBuilder.put(() => AddRecipeController()),
);
