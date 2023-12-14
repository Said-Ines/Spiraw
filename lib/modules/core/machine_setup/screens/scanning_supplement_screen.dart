import '../../../../bases/screens/exports.dart';
import '../controllers/scanning_template_controller.dart';
import 'scanning_template_screen.dart';

class ScanningSupplementScreen extends GetView<ScanningTemplateController> {
  const ScanningSupplementScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const ScanningTemplateScreen(
      title: 'Scanning supplement',
    );
  }
}
