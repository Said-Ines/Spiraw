import '../../bases/screens/exports.dart';

class HarvestSchedule extends StatelessWidget {
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
      title:
          Text(time, style: AppStyles.interregularTitle.copyWith(color: Colors.white).withSize(30)),
      subtitle: Text(daysList.join(','),
          style: AppStyles.interregularSubTitle.copyWith(color: Colors.white)),
      trailing: Switch.adaptive(
        value: true,
        onChanged: (isSwitched) {},
      ),
    );
  }
}
