import 'package:get/get.dart';
import 'package:spiraw/modules/design_sytem/ds2_screen.dart';

import 'ds_controller.dart';

final designSystemModule = GetPage(
  name: '/designSystemModule',
  page: () => const DS2Screen(),
  binding: BindingsBuilder.put(() => DesignSystemController()),
);
