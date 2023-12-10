import 'package:get/get.dart';

import 'splash_controller.dart';
import 'splash_screen.dart';

final splashModule = GetPage(
  name: '/splashModule',
  page: () => const SplashScreen(),
  binding: BindingsBuilder.put(() => SplashController()),
);
