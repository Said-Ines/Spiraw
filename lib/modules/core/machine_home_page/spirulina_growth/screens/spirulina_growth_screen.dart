import 'package:action_slider/action_slider.dart';
import 'package:intl/intl.dart';
import 'package:spiraw/modules/core/machine_home_page/controller/machine_home_page_controller.dart';

import '../../../../../bases/screens/exports.dart';
import '../../../../../widgets/home/dose_card.dart';
import '../../../../../widgets/home/harvest_schedule.dart';
import '../../data/harvest_schedule_model.dart';

class SpirulinaGrowthScreen extends GetView<MachineHomePageController> {
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
        Expanded(
          child: Observer(
            observes: controller.isSwitched,
            builder: (context, isSwitched) {
              // return HarvestSchedule(
              //   time: "03:10 PM",
              //   daysList: const ["Monday", "Tusday"],
              //   isSwitched: controller.isSwitched.value,
              //   onChanged: (isSwitched) {
              //     controller.toggleSwitch();
              //   },
              // );
              return const _HarvestSchedulesList();
            },
          ),
        ),
      ],
    );
  }
}

class _HarvestSchedulesList extends GetView<MachineHomePageController> {
  const _HarvestSchedulesList({super.key});

  @override
  Widget build(BuildContext context) {
    return controller.harvestSchedules.isEmpty
        ? Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Image.asset(
                  AppImages.noSchedulesIcon,
                  width: 150,
                  height: 150,
                ),
                const Gap(20),
                Text(
                  "No schedules here yet",
                  style: AppStyles.interSemiBoldTextButton.medium().withSize(FontSizes.headline5).withColor(Colors.white),
                ),
              ],
            ).align(alignment: Alignment.center),
          )
        : ListView.builder(
            itemCount: controller.harvestSchedules.length,
            itemBuilder: (context, index) {
              HarvestScheduleModel schedule = controller.harvestSchedules[index];

              return HarvestSchedule(
                time: DateFormat('kk:mm').format(schedule.time),
                daysList: schedule.days,
                isSwitched: controller.isSwitched.value,
                onChanged: (isSwitched) {
                  controller.toggleSwitch();
                },
              );
            },
          );
  }
}
