import '../../bases/screens/exports.dart';

class HarvestSchedule extends StatelessWidget {
  const HarvestSchedule({
    super.key,
    required this.daysList,
    required this.time,
    required this.isSwitched,
    this.onChanged,
  });
  final String time;
  final List<String> daysList;
  final bool isSwitched;
  final void Function(bool)? onChanged;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(time, style: AppStyles.interregularTitle.copyWith(color: Colors.white).withSize(30)),
      subtitle: Text(daysList.join(','), style: AppStyles.interregularSubTitle.copyWith(color: Colors.white)),
      trailing: Switch.adaptive(
        value: isSwitched,
        //controller.isSwitched.value,
        onChanged: onChanged,
        // (isSwitched) {
        //   //controller.toggleSwitch();
        // },
        activeColor: Colors.white,
        activeTrackColor: AppColors.activeToggleButton,
        inactiveTrackColor: AppColors.inactiveToggleButtonColor,
        inactiveThumbColor: Colors.white,
      ),
    );
  }
}
