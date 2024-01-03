import '../../bases/controllers/exports.dart';
import '../../utils/utils.dart';

class AfterSplashController extends GetxController {
  final performingApiCall = Observable(false);

  void toPhoneLoginScreen() => {
        performingApiCall.toggle(),
        Get.toNamed(phoneLoginModule.name),
        performingApiCall.toggle(),
      };

  void toLoginScreen() => {
        performingApiCall.toggle(),
        Get.toNamed(loginModule.name),
        performingApiCall.toggle(),
      };

  void toShopScreen() => Utils.showSnackBar("Shopping", "Coming soon");
}
