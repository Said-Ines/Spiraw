import '../../bases/screens/exports.dart';
import '../core/machine_setup/controllers/scanning_template_controller.dart';

class SuccessScreen extends GetView<ScanningTemplateController> {
  const SuccessScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SmartScaffold(
        body: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Image.asset(
          AppImages.successMark,
          height: 100,
          width: 100,
        ),
        const Gap(48),
        Text(
          "Your account has been successfully created!",
          style: AppStyles.poppinsboldHeadline3.withColor(Colors.white),
          textAlign: TextAlign.center,
        ),
        const Gap(48),
        Observer(
          observes: controller.performingApiCall,
          builder: (context, performingApiCall) => StyledButton(
            isLoading: performingApiCall,
            style: ButtonStyles.primary,
            title: "Setup your machine",
            onPressed: () {},
            isFromRecipe: true,
            reversed: true,
          ),
        ),
      ],
    ).customPadding(left: 25, right: 25));
  }
}
