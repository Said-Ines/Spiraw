import 'package:day_picker/day_picker.dart';
import 'package:flutter/material.dart';

import '../../../../bases/controllers/exports.dart';
import '../data/harvest_schedule_model.dart';

class MachineHomePageController extends GetxController with GetSingleTickerProviderStateMixin {
  late TabController tabController;
  final selectedTabIndex = Observable<int>(0);

  DateTime dateTime = DateTime.now();

  final isSwitched = Observable(false);

  final List<DayInWeek> days = [
    DayInWeek("S", dayKey: 'Sun'),
    DayInWeek("M", dayKey: 'Mon'),
    DayInWeek("T", dayKey: 'Tue'),
    DayInWeek("W", dayKey: 'Wed'),
    DayInWeek("T", dayKey: 'Thu'),
    DayInWeek("F", dayKey: 'Fri'),
    DayInWeek("S", dayKey: 'Sat'),
  ];
  List<String> selectedDates = [];

  final List<HarvestScheduleModel> harvestSchedules = [];

  @override
  void onInit() {
    super.onInit();
    tabController = TabController(length: 2, vsync: this);
    tabController.addListener(() {
      selectedTabIndex.value = tabController.index;
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

  @override
  void dispose() {
    super.dispose();
    tabController.dispose();
  }
}
