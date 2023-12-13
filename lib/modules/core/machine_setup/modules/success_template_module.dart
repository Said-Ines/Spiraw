import '../../../../bases/screens/exports.dart';
import '../controllers/scanning_template_controller.dart';
import '../screens/success_template_screen.dart';

final successTemplateModule = GetPage(
  name: '/successTemplateModule',
  page: () => SuccessTemplateScreen(
    title: 'Disinfinction',
    image: Image.asset(AppImages.successMark),
    text: "Chamber disinfected successfully. Ready for prime spirulina growth!",
  ),
  binding: BindingsBuilder.put(() => ScanningTemplateController()),
);
