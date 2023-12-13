import '../../../../bases/screens/exports.dart';
import '../controllers/scanning_template_controller.dart';
import '../screens/well_done_screen.dart';

final wellDoneModule = GetPage(
  name: '/wellDoneModule',
  page: () => const WellDoneScreen(),
  binding: BindingsBuilder.put(() => ScanningTemplateController()),
);
