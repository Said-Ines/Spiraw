import 'package:get/get.dart';

import 'ds_controller.dart';
import 'ds_screen.dart';

final designSystemModule = GetPage(
  name: '/designSystemModule',
  page: () => const DesignSystemScreen(),
  binding: BindingsBuilder.put(() => DesignSystemController()),
);
