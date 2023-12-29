import 'package:spiraw/modules/core/profile/profile_controller.dart';
import 'package:spiraw/modules/core/profile/profile_screen.dart';

import '../../../bases/screens/exports.dart';

final profileModule = GetPage(
  name: '/profileModule',
  page: () => const ProfileScreen(),
  binding: BindingsBuilder.put(() => ProfileController()),
);
