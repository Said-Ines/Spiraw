import '../../../../bases/screens/exports.dart';
import '../otp_controller.dart';
import '../otp_screen.dart';

final otpModule = GetPage(
  name: '/otpModule',
  page: () => const OtpScreen(),
  binding: BindingsBuilder.put(() => OtpController()),
);
