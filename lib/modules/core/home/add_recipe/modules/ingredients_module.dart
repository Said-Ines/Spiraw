import 'package:spiraw/modules/core/home/add_recipe/screens/ingredients_screen.dart';

import '../../../../../bases/screens/exports.dart';
import '../controllers/add_recipe_controller.dart';

final ingredientsModule = GetPage(
  name: '/ingredientsModule',
  page: () => const IngredientsScreen(),
  binding: BindingsBuilder.put(() => AddRecipeController()),
);
