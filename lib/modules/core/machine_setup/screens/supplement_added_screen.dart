import '../../../../bases/screens/exports.dart';
import '../controllers/scanning_template_controller.dart';
import 'success_template_screen.dart';

class SupplementAddedScreen extends GetView<ScanningTemplateController> {
  const SupplementAddedScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SuccessTemplateScreen(
      title: 'Supplement added',
      image: Image.asset(AppImages.successMark),
      text: 'Supplement added successfully. Ready for prime spirulina growth!',
      onPressed: controller.toScanningStarter,
    );
  }
}
