import 'package:spiraw/modules/core/machine_home_page/controller/machine_home_page_controller.dart';

import '../../../../../bases/controllers/exports.dart';
import '../screens/eco_impact_screen.dart';

final ecoImpactModule = GetPage(
  name: '/ecoImpactModule',
  page: () => const EcoImpactScreen(),
  binding: BindingsBuilder.put(() => MachineHomePageController()),
);
