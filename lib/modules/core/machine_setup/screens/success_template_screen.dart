import '../../../../bases/screens/exports.dart';
import '../../../../widgets/back_button.dart';
import '../controllers/scanning_template_controller.dart';

class SuccessTemplateScreen extends GetView<ScanningTemplateController> {
  final String title;
  final Widget? image;
  final String? text;
  final String? caption;
  final void Function() onPressed;

  const SuccessTemplateScreen({
    super.key,
    required this.title,
    this.image,
    this.text,
    this.caption,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return SmartScaffold(
      body: ScrollableForm(
        children: [
          Text(
            title,
            style: AppStyles.interboldHeadline3.withColor(Colors.white).withSize(FontSizes.headline4),
          ),
          const Gap(20),
          Text(
            caption ?? "",
            textAlign: TextAlign.center,
            style: AppStyles.interregularSubTitle.withSize(FontSizes.subtitle).medium(),
          ),
          const Gap(70),
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
            style: AppStyles.interboldHeadline3.withSize(FontSizes.title).withColor(Colors.white),
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
                  onPressed: onPressed,
                ),
              ),
            ],
          ).align(alignment: Alignment.bottomCenter)
        ],
      ).paddingOnly(top: 50, bottom: 10),
    );
  }
}
