import '../../../bases/modules/exports.dart';
import '../after_splash_controller.dart';
import '../after_splash_screen.dart';

final afterSplashModule = GetPage(
  name: '/afterSplashModule',
  page: () => const AfterSplashScreen(),
  binding: BindingsBuilder.put(() => AfterSplashController()),
);
