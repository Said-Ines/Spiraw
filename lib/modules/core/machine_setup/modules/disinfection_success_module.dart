import '../../../../bases/screens/exports.dart';
import '../controllers/scanning_template_controller.dart';
import '../screens/disinfection_success_screen.dart';

final disinfinctionSuccessModule = GetPage(
  name: '/disinfinctionSuccessModule',
  page: () => const DisinfectionSuccessScreen(),
  binding: BindingsBuilder.put(
    () => ScanningTemplateController(),
  ),
);
