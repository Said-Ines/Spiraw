import 'package:spiraw/bases/controllers/exports.dart';

import '../controllers/scanning_template_controller.dart';
import 'scanning_template_screen.dart';

class ScanningSupplementScreen extends GetView<ScanningTemplateController> {
  const ScanningSupplementScreen({super.key});

  @override
  Widget build(BuildContext context) {
    controller.navigateToScreen = () {
      Future.delayed(const Duration(seconds: 2), () {
        Get.offAllNamed(supplementAddedModule.name);
      });
    };
    return const ScanningTemplateScreen(
      title: 'Scanning supplement',
    );
  }
}
