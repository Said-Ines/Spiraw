import '../../bases/screens/exports.dart';
import '../../modules/core/machine_home_page/spirulina_growth/controller/spirulina_growth_controller.dart';

class HarvestSchedule extends GetView<SpirulinaGrowthController> {
  const HarvestSchedule({
    super.key,
    required this.daysList,
    required this.time,
  });
  final String time;
  final List<String> daysList;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(time, style: AppStyles.interregularTitle.copyWith(color: Colors.white).withSize(30)),
      subtitle: Text(daysList.join(','), style: AppStyles.interregularSubTitle.copyWith(color: Colors.white)),
      trailing: Observer(
          observes: controller.isSwitched,
          builder: (context, isSwitched) {
            return Switch.adaptive(
              value: controller.isSwitched.value,
              onChanged: (isSwitched) {
                controller.toggleSwitch();
              },
              activeColor: Colors.white,
              activeTrackColor: AppColors.activeToggleButton,
              inactiveTrackColor: AppColors.inactiveToggleButtonColor,
            );
          }),
    );
  }
}
