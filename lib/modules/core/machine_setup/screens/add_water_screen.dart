import 'package:gap/gap.dart';

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
            style: AppStyles.interboldHeadline1.withSize(FontSizes.headline2).withColor(Colors.white),
          ).center(),
          const Gap(20),
          Text(
            "Please fill your Spiraw with water to finish the setup.",
            textAlign: TextAlign.center,
            style: AppStyles.interSemiBoldTextButton.withSize(FontSizes.headline5).withColor(Colors.white).medium(),
          ).center(),
          const Gap(130),
          const Placeholder(),
          const Gap(36),
          Text(
            "Filled",
            style: AppStyles.interSemiBoldTextButton.withSize(FontSizes.headline2).withColor(Colors.white),
          ),
          const Gap(190),
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
          )
        ],
      ),
    );
  }
}
