import '../../../../bases/screens/exports.dart';
import '../controllers/scanning_template_controller.dart';
import '../screens/disinfection_screen.dart';

final disinfinctionModule = GetPage(
  name: '/disinfinctionModule',
  page: () => const DisinfectionScreen(),
  binding: BindingsBuilder.put(() => ScanningTemplateController()),
);
