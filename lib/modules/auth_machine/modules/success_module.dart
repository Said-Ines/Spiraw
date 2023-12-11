import 'package:spiraw/modules/auth_machine/controllers/scanner_controller.dart';
import 'package:spiraw/modules/auth_machine/success_screen.dart';

import '../../../bases/screens/exports.dart';

final successModule = GetPage(
  name: '/successModule',
  page: () => const SuccessScreen(),
  binding: BindingsBuilder.put(() => ScannerController()),
);
