import '../../../bases/screens/exports.dart';
import '../controllers/scanner_controller.dart';

final scannerModule = GetPage(
  name: '/scannerModule',
  page: () => const ScannerScreen(),
  binding: BindingsBuilder.put(() => ScannerController()),
);
