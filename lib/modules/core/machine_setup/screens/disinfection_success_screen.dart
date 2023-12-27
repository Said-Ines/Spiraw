import '../../../../bases/screens/exports.dart';
import '../controllers/scanning_template_controller.dart';
import 'success_template_screen.dart';

class DisinfectionSuccessScreen extends GetView<ScanningTemplateController> {
  const DisinfectionSuccessScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SuccessTemplateScreen(
      onPressed: controller.toWellDoneScreen,
      title: 'Disinfection',
      caption: 'Effortless Sanitization for a Pristine Cultivation Chamber',
      image: Image.asset(AppImages.successMark),
      text: 'Chamber disinfected successfully. Ready for prime spirulina growth!',
    );
  }
}
