import '../../../../bases/screens/exports.dart';
import '../controllers/scanning_template_controller.dart';
import '../screens/supplement_added_screen.dart';

final supplementAddedModule = GetPage(
  name: '/supplementAddedModule',
  page: () => const SupplementAddedScreen(),
  binding: BindingsBuilder.put(() => ScanningTemplateController()),
);
