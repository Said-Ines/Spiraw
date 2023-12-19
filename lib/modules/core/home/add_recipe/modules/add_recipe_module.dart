import '../../../../../bases/screens/exports.dart';
import '../controllers/add_recipe_controller.dart';
import '../screens/add_recipe_screen.dart';

final addRecipeModule = GetPage(
  name: '/addRecipeModule',
  page: () => const AddRecipeScreen(),
  binding: BindingsBuilder.put(() => AddRecipeController()),
);
