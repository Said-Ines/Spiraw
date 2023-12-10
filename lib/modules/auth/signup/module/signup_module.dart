import '../../../../bases/screens/exports.dart';
import '../signup_controller.dart';
import '../signup_screen.dart';

final signupModule = GetPage(
  name: '/signupModule',
  page: () => const SignUpScreen(),
  binding: BindingsBuilder.put(() => SignUpController()),
);
