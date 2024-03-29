import '../../../../bases/screens/exports.dart';
import '../login_controller.dart';
import '../login_screen.dart';

final loginModule = GetPage(
  name: '/signinModule',
  page: () => const LoginScreen(),
  binding: BindingsBuilder.put(() => LoginController()),
);
