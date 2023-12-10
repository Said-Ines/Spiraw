part of 'main.dart';

//* -------------------------------------------
//* User Interface Setup

class _Styling {
  static void statusBarTransparency() =>
      SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
        statusBarColor: Colors.transparent,
        systemNavigationBarColor: AppColors.greyBackground,
        systemNavigationBarIconBrightness: Brightness.light,
      ));

  static void allowedDeviceOrientations() =>
      SystemChrome.setPreferredOrientations([
        DeviceOrientation.portraitUp,
      ]);
}
