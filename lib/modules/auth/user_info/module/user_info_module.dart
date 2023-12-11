import '../../../../bases/screens/exports.dart';
import '../user_info_controller.dart';
import '../user_info_screen.dart';

final userInfoModule = GetPage(
  name: '/userInfoModule',
  page: () => const UserInfoScreen(),
  binding: BindingsBuilder.put(() => UserInfoController()),
);
