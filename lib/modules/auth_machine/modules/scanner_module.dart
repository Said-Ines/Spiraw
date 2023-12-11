import 'package:spiraw/modules/auth_machine/controllers/scanner_controller.dart';

import '../../../bases/screens/exports.dart';

final scannerModule = GetPage(
  name: '/scannerModule',
  page: () => const ScannerScreen(),
  binding: BindingsBuilder.put(() => ScannerController()),
);
