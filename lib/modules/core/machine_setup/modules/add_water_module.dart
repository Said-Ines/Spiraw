import '../../../../bases/screens/exports.dart';
import '../controllers/add_water_controller.dart';
import '../screens/add_water_screen.dart';

final addWaterModule = GetPage(
  name: '/addWaterModule',
  page: () => const AddWaterScreen(),
  binding: BindingsBuilder.put(() => AddWaterController()),
);
