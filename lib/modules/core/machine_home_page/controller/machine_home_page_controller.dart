import 'package:day_picker/day_picker.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

import '../../../../bases/controllers/exports.dart';
import '../data/harvest_schedule_model.dart';

class MachineHomePageController extends GetxController with GetTickerProviderStateMixin {
  late TabController tabController;
  late TabController ecoImpactTabController;
  late TabController spirulnaConsumedTabController;

  final selectedTabIndex = Observable<int>(0);
  final selectedEcoImpactTabIndex = Observable<int>(0);

  final selectedSpirulinaConsumedTabIndex = Observable<int>(0);

  DateTime dateTime = DateTime.now();

  final isSwitched = Observable(false);

  int selectedBarIndex = -1;

  final List<DayInWeek> days = [
    DayInWeek("S", dayKey: 'Sun'),
    DayInWeek("M", dayKey: 'Mon'),
    DayInWeek("T", dayKey: 'Tue'),
    DayInWeek("W", dayKey: 'Wed'),
    DayInWeek("T", dayKey: 'Thu'),
    DayInWeek("F", dayKey: 'Fri'),
    DayInWeek("S", dayKey: 'Sat'),
  ];

  List<String> weeks = [
    'W1',
    'W2',
    'W3',
    'W4',
  ];

  List<String> months = [
    'Jan',
    'Feb',
    'Mar',
    'Apr',
    'May',
    'Jun',
    'Jul',
    'Aug',
    'Sep',
    'Oct',
    'Nov',
    'Dec',
  ];

  List<String> selectedDates = [];

  final List<HarvestScheduleModel> harvestSchedules = [];

  @override
  void onInit() {
    super.onInit();
    tabController = TabController(length: 2, vsync: this);
    ecoImpactTabController = TabController(length: 3, vsync: this);
    tabController.addListener(() {
      selectedTabIndex.value = tabController.index;
    });
    ecoImpactTabController.addListener(() {
      selectedEcoImpactTabIndex.value = ecoImpactTabController.index;
    });

    spirulnaConsumedTabController = TabController(length: 3, vsync: this);
    spirulnaConsumedTabController.addListener(() {
      selectedSpirulinaConsumedTabIndex.value = spirulnaConsumedTabController.index;
    });
  }

  void toggleSwitch() {
    isSwitched.toggle();
  }

  void toScheduleTimeScreen() {
    Get.toNamed(scheduleTimeModule.name);
  }

  void addHarvestSchedule(HarvestScheduleModel schedule) {
    harvestSchedules.add(schedule);
    update();
  }

  void saveSchedule() {
    HarvestScheduleModel newSchedule = HarvestScheduleModel(
      time: dateTime,
      days: selectedDates,
    );
    addHarvestSchedule(newSchedule);
    Get.back();
  }

  void handleBarTapped(int index) {
    selectedBarIndex = index;
  }

  List<BarChartGroupData> getBarGroups(int tabIndex) {
    List<String> data;
    if (tabIndex == 0) {
      data = days.map((day) => day.dayKey).toList(); // Today
    } else if (tabIndex == 1) {
      data = weeks.toList(); // Weekly
    } else {
      data = months.toList(); // Monthly
    }

    return List.generate(
      data.length,
      (index) {
        final isSelected = selectedBarIndex == index;
        return BarChartGroupData(
          x: index,
          barRods: [
            BarChartRodData(
              toY: 5, // Replace with your actual data value
              color: isSelected ? Colors.white : Colors.white.withOpacity(0.5),
            ),
          ],
          //showingTooltipIndicators: isSelected ? [0] : [],
        );
      },
    );
  }

  @override
  void dispose() {
    super.dispose();
    tabController.dispose();
    ecoImpactTabController.dispose();
    spirulnaConsumedTabController.dispose();
  }
}
