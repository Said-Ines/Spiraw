import 'package:get/get.dart';
import 'package:spiraw/modules/design_sytem/ds_controller.dart';
import 'package:spiraw/modules/design_sytem/ds_screen.dart';

import 'ds_controller.dart';
import 'ds_screen.dart';
import 'package:spiraw/modules/design_sytem/ds2_screen.dart';



final designSystemModule = GetPage(
  name: '/designSystemModule',
  page: () => const DesignSystemScreen(),
  binding: BindingsBuilder.put(() => DesignSystemController()),
);
