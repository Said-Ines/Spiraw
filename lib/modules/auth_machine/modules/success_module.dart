import '../../../bases/screens/exports.dart';
import '../controllers/scanner_controller.dart';
import '../success_screen.dart';

final successModule = GetPage(
  name: '/successModule',
  page: () => const SuccessScreen(),
  binding: BindingsBuilder.put(() => ScannerController()),
);
