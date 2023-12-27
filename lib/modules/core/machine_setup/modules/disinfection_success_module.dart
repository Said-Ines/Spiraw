import 'package:spiraw/modules/core/machine_setup/screens/disinfection_success_screen.dart';

import '../../../../bases/screens/exports.dart';
import '../controllers/scanning_template_controller.dart';

final disinfinctionSuccessModule = GetPage(
  name: '/disinfinctionSuccessModule',
  page: () => const DisinfectionSuccessScreen(),
  binding: BindingsBuilder.put(
    () => ScanningTemplateController(),
  ),
);
