import 'package:spiraw/bases/screens/exports.dart';
import 'package:spiraw/modules/core/profile/profile_controller.dart';

class ProfileScreen extends GetView<ProfileController> {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: GestureDetector(onTap: () => controller.logout(), child: const Text('logout')),
    );
  }
}
