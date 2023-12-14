import '../../../../bases/screens/exports.dart';
import '../controllers/scanning_template_controller.dart';
import 'success_template_screen.dart';

class StarterAddedScreen extends GetView<ScanningTemplateController> {
  const StarterAddedScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SuccessTemplateScreen(
      title: 'Starter added',
      image: Image.asset(AppImages.successMark),
      text: 'Starter added successfully. Ready for prime spirulina growth!',
    );
  }
}
