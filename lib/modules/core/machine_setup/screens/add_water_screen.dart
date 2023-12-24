import '../../../../bases/screens/exports.dart';
import '../../../../widgets/back_button.dart';
import '../controllers/add_water_controller.dart';

class AddWaterScreen extends GetView<AddWaterController> {
  const AddWaterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SmartScaffold(
      body: ScrollableForm(
        children: [
          Text(
            "Add Water",
            style: AppStyles.interboldHeadline1.withSize(FontSizes.headline3).withColor(Colors.white),
          ).center(),
          const Gap(20),
          Text(
            "Please fill your Spiraw with water to finish the setup.",
            textAlign: TextAlign.center,
            style: AppStyles.interSemiBoldTextButton.withSize(FontSizes.headline6).withColor(Colors.white).medium(),
          ).center(),
          const Gap(100),
          Obx(() => Image.asset(
                controller.imagePaths[controller.currentIndex.value],
                width: 240,
                height: 240,
              )),
          const Gap(36),
          Obx(() => Text(
                controller.textList[controller.currentIndex.value],
                style: AppStyles.interSemiBoldTextButton.withSize(FontSizes.headline2).withColor(Colors.white),
              )),
          const Gap(80),
          Row(
            children: [
              const BackButton(fromMachineSetup: true),
              const Gap(24),
              Obx(
                () => Expanded(
                  child: StyledButton(
                    style: controller.currentIndex.value < 2 ? ButtonStyles.inactif : ButtonStyles.primary,
                    title: "Next step",
                    onPressed: controller.currentIndex.value == 2 ? controller.toScanningSupplement : () {},
                  ),
                ),
              )
            ],
          )
        ],
      ).paddingOnly(top: AppConstants.minBodyTopPadding),
    );
  }
}
