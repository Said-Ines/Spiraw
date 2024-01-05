import '../../../../../bases/controllers/exports.dart';
import '../controller/spirulina_growth_controller.dart';
import '../screens/spirulina_growth_screen.dart';

final spirulinaGrowthModule = GetPage(
  name: '/spirulinaGrowthModule',
  page: () => const SpirulinaGrowthScreen(),
  binding: BindingsBuilder.put(() => SpirulinaGrowthController()),
);
