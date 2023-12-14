import 'package:gap/gap.dart';

import '../../../../bases/screens/exports.dart';
import '../../../../widgets/back_button.dart';
import '../controllers/scanning_template_controller.dart';

class SuccessTemplateScreen extends GetView<ScanningTemplateController> {
  final String title;
  final Widget? image;
  final String? text;
  final String? caption;

  const SuccessTemplateScreen({
    super.key,
    required this.title,
    this.image,
    this.text,
    this.caption,
  });

  @override
  Widget build(BuildContext context) {
    return SmartScaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            title,
            style: AppStyles.interboldHeadline3.withColor(Colors.white).withSize(FontSizes.headline3),
          ),
          const Gap(20),
          Text(
            caption ?? "",
            textAlign: TextAlign.center,
            style: AppStyles.interregularSubTitle.withSize(FontSizes.headline5).medium(),
          ),
          Gap(Get.height * 0.2),
          SizedBox(
            height: 100,
            width: 100,
            child: image ??
                const Placeholder(
                  fallbackWidth: 100,
                  fallbackHeight: 100,
                ),
          ),
          const Gap(48),
          Text(
            text ?? "",
            style: AppStyles.interboldHeadline3.withSize(FontSizes.headline6).withColor(Colors.white),
            textAlign: TextAlign.center,
          ).center(),
          Gap(Get.height * 0.2),
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
          ).align(alignment: Alignment.bottomCenter)
        ],
      ).paddingOnly(
          left: AppConstants.bodyMinSymetricHorizontalPadding,
          right: AppConstants.bodyMinSymetricHorizontalPadding,
          top: 50,
          bottom: 10),
    );
  }
}
