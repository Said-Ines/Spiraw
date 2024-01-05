import '../../../../../bases/controllers/exports.dart';
import '../controllers/eco_impact_controller.dart';
import '../screens/eco_impact_screen.dart';

final ecoImpactModule = GetPage(
  name: '/ecoImpactModule',
  page: () => const EcoImpactScreen(),
  binding: BindingsBuilder.put(() => EcoImpactController()),
);
