import '../../../../../bases/screens/exports.dart';

class SpirulinaGrowthController extends GetxController {
  final isSwitched = Observable(false);

  void toggleSwitch() {
    isSwitched.toggle();
  }
}
