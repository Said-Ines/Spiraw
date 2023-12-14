import 'package:gap/gap.dart';

import '../../../../bases/screens/exports.dart';
import '../../../../widgets/back_button.dart';

class WellDoneScreen extends StatelessWidget {
  const WellDoneScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SmartScaffold(
        body: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Image.asset(
          AppImages.screensImage,
          height: 360,
          width: 520,
        ),
        const Gap(35),
        Text(
          'Well done!',
          style: AppStyles.interboldHeadline3.withColor(Colors.white).withSize(FontSizes.headline2),
        ),
        const Gap(15),
        Text(
          "You've successfully added\n the machine to Spiraw app.",
          textAlign: TextAlign.center,
          style: AppStyles.interboldHeadline3.medium().withColor(Colors.white).withSize(FontSizes.headline5),
        ).paddingSymmetric(horizontal: AppConstants.bodyMinSymetricHorizontalPadding),
        const Gap(70),
        Row(
          children: [
            const BackButton(fromMachineSetup: true),
            const Gap(24),
            Expanded(
              child: StyledButton(
                style: ButtonStyles.primary,
                title: "Next step",
                onPressed: () {},
              ),
            ),
          ],
        ).paddingSymmetric(horizontal: AppConstants.bodyMinSymetricHorizontalPadding),
      ],
    ).paddingOnly(top: 80));
  }
}
