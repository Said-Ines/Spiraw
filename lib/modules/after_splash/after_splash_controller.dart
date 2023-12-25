import 'package:spiraw/bases/controllers/exports.dart';
import 'package:spiraw/utils/utils.dart';

class AfterSplashController extends GetxController {
  final performingApiCall = Observable(false);

  void toPhoneLoginScreen() => {
        performingApiCall.toggle(),
        Get.toNamed(phoneLoginModule.name),
        performingApiCall.toggle(),
      };

  void toShopScreen() => Utils.showSnackBar("Shopping", "Coming soon");
}
