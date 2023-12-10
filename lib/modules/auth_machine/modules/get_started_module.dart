import 'package:get/get.dart';

import '../controllers/get_started_controller.dart';
import '../get_started_screen.dart';

final getStartedModule = GetPage(
  name: '/getStartedModule',
  page: () => const GetStartedScreen(),
  binding: BindingsBuilder.put(() => GetStartedController()),
);
