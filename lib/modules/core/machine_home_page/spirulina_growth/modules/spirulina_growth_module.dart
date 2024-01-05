import 'package:spiraw/modules/core/machine_home_page/controller/machine_home_page_controller.dart';

import '../../../../../bases/controllers/exports.dart';
import '../screens/spirulina_growth_screen.dart';

final spirulinaGrowthModule = GetPage(
  name: '/spirulinaGrowthModule',
  page: () => const SpirulinaGrowthScreen(),
  binding: BindingsBuilder.put(() => MachineHomePageController()),
);
