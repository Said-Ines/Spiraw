import 'package:spiraw/modules/auth_machine/modules/scanner_module.dart';

import '../../../bases/screens/exports.dart';

class GetStartedController extends GetxController {
  final performingApiCall = Observable(false);
  void toScannerScreen() {
    Get.toNamed(scannerModule.name);
  }
}
