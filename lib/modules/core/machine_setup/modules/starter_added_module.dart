import '../../../../bases/screens/exports.dart';
import '../controllers/scanning_template_controller.dart';
import '../screens/starter_added_screen.dart';

final starterAddedModule = GetPage(
  name: '/starterAddedModule',
  page: () => const StarterAddedScreen(),
  binding: BindingsBuilder.put(() => ScanningTemplateController()),
);
