import '../../../../bases/screens/exports.dart';
import '../controllers/scanning_template_controller.dart';
import 'success_template_screen.dart';

class DisinfectionScreen extends GetView<ScanningTemplateController> {
  const DisinfectionScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const SuccessTemplateScreen(
      title: 'Disinfection',
      caption: 'Effortless Sanitization for a Pristine Cultivation Chamber',
    );
  }
}
