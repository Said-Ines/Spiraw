import '../../../../bases/screens/exports.dart';
import '../controllers/scanning_template_controller.dart';
import '../screens/scanning_starter_screen.dart';

final scanningStarterModule = GetPage(
  name: '/scanningStarterModule',
  page: () => const ScanningStarterScreen(),
  binding: BindingsBuilder.put(
    () => ScanningTemplateController(),
  ),
);
