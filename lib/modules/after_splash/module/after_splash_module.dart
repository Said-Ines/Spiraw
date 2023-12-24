import 'package:spiraw/modules/after_splash/after_splash_controller.dart';
import 'package:spiraw/modules/after_splash/after_splash_screen.dart';

import '../../../bases/modules/exports.dart';

final afterSplashModule = GetPage(
  name: '/afterSplashModule',
  page: () => const AfterSplashScreen(),
  binding: BindingsBuilder.put(() => AfterSplashController()),
);
