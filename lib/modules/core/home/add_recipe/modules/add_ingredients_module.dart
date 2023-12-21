import '../../../../../bases/screens/exports.dart';
import '../controllers/add_recipe_controller.dart';
import '../screens/add_ingredients_screen.dart';

final addIngredientsModule = GetPage(
  name: '/addIngredientsModule',
  page: () => const AddIngredientsScreen(),
  binding: BindingsBuilder.put(() => AddRecipeController()),
);
