import '../../../bases/screens/exports.dart';
import '../modules/scanner_module.dart';

class GetStartedController extends GetxController {
  final performingApiCall = Observable(false);
  void toScannerScreen() {
    Get.toNamed(scannerModule.name);
  }
}
