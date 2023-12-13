import '../../../../bases/screens/exports.dart';
import '../controllers/scanning_template_controller.dart';
import '../screens/scanning_template_screen.dart';

final scanningTemplateModule = GetPage(
  name: '/scanningTemplateModule',
  page: () => const ScanningTemplateScreen(
    title: "Title",
  ),
  binding: BindingsBuilder.put(() => ScanningTemplateController()),
);
