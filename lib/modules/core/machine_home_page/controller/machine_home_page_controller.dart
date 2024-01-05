import 'package:flutter/material.dart';

import '../../../../bases/controllers/exports.dart';

class MachineHomePageController extends GetxController with GetSingleTickerProviderStateMixin {
  late TabController tabController;
  final selectedTabIndex = Observable<int>(0);

  final isSwitched = Observable(false);

  void toggleSwitch() {
    isSwitched.toggle();
  }

  @override
  void onInit() {
    super.onInit();
    tabController = TabController(length: 2, vsync: this);
    tabController.addListener(() {
      selectedTabIndex.value = tabController.index;
    });
  }

  @override
  void dispose() {
    super.dispose();
    tabController.dispose();
  }
}
