import 'package:spiraw/modules/core/machine_home_page/screens/schedule_time_screen.dart';

import '../../../../bases/screens/exports.dart';
import '../controller/machine_home_page_controller.dart';

final scheduleTimeModule = GetPage(
  name: '/scheduleTimeModule',
  page: () => const ScheduleTimeScreen(),
  binding: BindingsBuilder.put(() => MachineHomePageController()),
);
