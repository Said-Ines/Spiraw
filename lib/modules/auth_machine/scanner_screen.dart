import '../../bases/screens/exports.dart';
import '../all_modules.dart';
import '../core/machine_setup/controllers/scanning_template_controller.dart';
import '../core/machine_setup/screens/scanning_template_screen.dart';

class ScannerScreen extends GetView<ScanningTemplateController> {
  const ScannerScreen({super.key});

  @override
  Widget build(BuildContext context) {
    controller.navigateToScreen = () {
      Future.delayed(const Duration(seconds: 2), () {
        Get.offAllNamed(successModule.name);
      });
    };
    return const ScanningTemplateScreen(title: "Scanning");
  }
}
