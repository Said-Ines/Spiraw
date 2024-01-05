import 'package:action_slider/action_slider.dart';

import '../../../../../bases/screens/exports.dart';
import '../../../../../widgets/home/dose_card.dart';
import '../../../../../widgets/home/harvest_schedule.dart';
import '../controller/spirulina_growth_controller.dart';

class SpirulinaGrowthScreen extends GetView<SpirulinaGrowthController> {
  const SpirulinaGrowthScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Row(
          children: [
            Expanded(
              child: DoseCard(
                percentage: 100,
                title: "Available",
                status: DoseStatus.completed,
              ),
            ),
            Gap(20),
            Expanded(
              child: DoseCard(
                title: "Dozes",
                doses: 12,
                status: DoseStatus.incompleted,
              ),
            ),
          ],
        ),
        const Gap(30),
        Center(
          child: ActionSlider.custom(
            sliderBehavior: SliderBehavior.stretch,
            foregroundBuilder: (context, state, child) => child!,
            outerBackgroundBuilder: (context, state, child) => Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(100),
                color: AppColors.inputColor,
              ),
              child: Center(
                child: Row(
                  children: [
                    Text('Harvest now', style: AppStyles.interSemiBoldTextButton.withColor(Colors.white)),
                    const Spacer(),
                    Image.asset(
                      AppImages.arrowForwardDuoIcon,
                      width: 32,
                      height: 32,
                    )
                  ],
                ).paddingOnly(left: Get.width * 0.35, right: 10),
              ),
            ),
            backgroundColor: AppColors.inputColor,
            toggleWidth: 100,
            height: 50,
            toggleMargin: EdgeInsets.zero,
            foregroundChild: DecoratedBox(
                decoration: BoxDecoration(color: AppColors.secondary, borderRadius: BorderRadius.circular(100)),
                child: const Icon(Icons.check_rounded, color: Colors.white)),
            action: (controller) async {
              controller.loading(); //starts loading animation
              await Future.delayed(const Duration(seconds: 3));
              controller.success(); //starts success animation
              await Future.delayed(const Duration(seconds: 1));
              controller.reset(); //resets the slider
            },
          ),
        ),
        const Gap(30),
        Text("Harvest Schedules", style: AppStyles.interboldHeadline3.withSize(FontSizes.headline6).withColor(Colors.white)),
        const Gap(30),
        const HarvestSchedule(
          time: "03:10 PM",
          daysList: ["Monday", "Tusday"],
        ),
      ],
    );
  }
}
