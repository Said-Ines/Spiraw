import '../../../../bases/screens/exports.dart';
import '../controller/machine_home_page_controller.dart';
import '../screens/machine_home_page_screen.dart';

final machineHomePageModule = GetPage(
  name: '/machineHomePageModule',
  page: () => const MachineHomePageScreen(),
  binding: BindingsBuilder.put(() => MachineHomePageController()),
);
