import '../../../../../bases/screens/exports.dart';
import '../controllers/add_recipe_controller.dart';
import '../screens/time_spent_screen.dart';

final timeSpentModule = GetPage(
  name: '/timeSpentModule',
  page: () => const TimeSpentScreen(),
  binding: BindingsBuilder.put(() => AddRecipeController()),
);
