import '../resources/app_resources.dart';

class AppImages {
  const AppImages._();

  static const imagesFolder = AppResources.imagesFolder;

  static const appLogo = "$imagesFolder/app_logo.png";
  static const splashImage = "$imagesFolder/splash_image.png";
  static const groupImage = "$imagesFolder/group_98.png";

  static const visibilityIcon = "$imagesFolder/visibility_icon.png";

  static const googleIcon = "$imagesFolder/google_icon.png";

  static const facebookIcon = "$imagesFolder/facebook_icon.png";
  static const bottomBar = _BottomBar();
}

class _BottomBar {
  const _BottomBar();

  final shopping = "${AppImages.imagesFolder}/shopping.png";
  final twoPersons = "${AppImages.imagesFolder}/two_persons.png";
  final home = "${AppImages.imagesFolder}/home.png";
  final profile = "${AppImages.imagesFolder}/profile_image.png";
}
