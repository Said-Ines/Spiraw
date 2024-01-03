import '../../../../../bases/screens/exports.dart';
import '../controllers/add_recipe_controller.dart';
import '../screens/ingredients_after_add_screen.dart';

final ingredientsAfterAddModule = GetPage(
  name: '/ingredientsAfterAddModule',
  page: () => const IngredientsAfterAddScreen(),
  binding: BindingsBuilder.put(() => AddRecipeController()),
);
