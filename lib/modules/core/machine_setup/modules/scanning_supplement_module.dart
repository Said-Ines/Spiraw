import '../../../../bases/screens/exports.dart';
import '../controllers/scanning_template_controller.dart';
import '../screens/scanning_supplement_screen.dart';

final scanningSupplementModule = GetPage(
  name: '/scanningSupplementModule',
  page: () => const ScanningSupplementScreen(),
  binding: BindingsBuilder.put(
    () => ScanningTemplateController(),
  ),
);
