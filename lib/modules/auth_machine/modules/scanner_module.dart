import '../../../bases/screens/exports.dart';
import '../../core/machine_setup/controllers/scanning_template_controller.dart';

final scannerModule = GetPage(
  name: '/scannerModule',
  page: () => const ScannerScreen(),
  binding: BindingsBuilder.put(() => ScanningTemplateController()),
);
