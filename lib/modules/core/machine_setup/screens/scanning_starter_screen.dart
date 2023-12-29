import '../../../../bases/controllers/exports.dart';
import '../controllers/scanning_template_controller.dart';
import 'scanning_template_screen.dart';

class ScanningStarterScreen extends GetView<ScanningTemplateController> {
  const ScanningStarterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    controller.navigateToScreen = () {
      Future.delayed(const Duration(seconds: 2), () {
        Get.offAllNamed(starterAddedModule.name);
      });
    };
    return const ScanningTemplateScreen(
      title: 'Scanning starter',
    );
  }
}
