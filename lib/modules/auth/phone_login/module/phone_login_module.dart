import '../../../../bases/screens/exports.dart';
import '../phone_login_controller.dart';
import '../phone_login_screen.dart';

final phoneLoginModule = GetPage(
    name: '/phoneLoginModule', page: () => const PhoneLoginScreen(), binding: BindingsBuilder.put(() => PhoneLoginController()));
