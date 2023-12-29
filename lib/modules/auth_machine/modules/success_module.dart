import '../../../bases/screens/exports.dart';
import '../../core/machine_setup/controllers/scanning_template_controller.dart';
import '../success_screen.dart';

final successModule = GetPage(
  name: '/successModule',
  page: () => const SuccessScreen(),
  binding: BindingsBuilder.put(() => ScanningTemplateController()),
);
