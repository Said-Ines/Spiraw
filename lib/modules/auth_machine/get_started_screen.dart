import '../../bases/screens/exports.dart';
import 'controllers/get_started_controller.dart';

class GetStartedScreen extends GetView<GetStartedController> {
  const GetStartedScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SmartScaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            "Get started",
            style: AppStyles.interboldHeadline1.withColor(Colors.white),
          ),
          const Gap(20),
          Text(
            "Align the QR code with the camera to scan.",
            textAlign: TextAlign.center,
            style: AppStyles.interregularSubTitle.withColor(Colors.white).withSize(FontSizes.headline5),
          ),
          const Gap(40),
          Image.asset(AppImages.qrScanner),
          const Gap(40),
          Observer(
            observes: controller.performingApiCall,
            builder: (context, performingApiCall) => StyledButton(
              isLoading: performingApiCall,
              style: ButtonStyles.primary,
              title: "Next",
              onPressed: controller.toScannerScreen,
              icon: const Icon(Icons.keyboard_arrow_right_outlined),
              isFromRecipe: true,
              reversed: true,
            ),
          ),
        ],
      ).customPadding(left: 25, right: 25),
    );
  }
}
