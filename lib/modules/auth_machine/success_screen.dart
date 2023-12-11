import 'package:gap/gap.dart';

import '../../bases/screens/exports.dart';
import 'controllers/scanner_controller.dart';

class SuccessScreen extends GetView<ScannerController> {
  const SuccessScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SmartScaffold(
        displayAppBar: false,
        backgroundColor: AppColors.primary,
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
