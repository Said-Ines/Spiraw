part of 'main.dart';

class _Binding {
  static Future<void> asynchronous() async {
    await Future.wait([
      Get.putAsync(() => SharedPreferences.getInstance(), permanent: true),
    ]);
  }

  static synchronous() async {
    //& Packages
    // time_zone_package.initializeTimeZones();

    //& Services
    // Get.lazyPut(() => ConnectivityManager(), fenix: true);
    Get.lazyPut(() => PhoneLoginService(), fenix: true);
    Get.lazyPut(() => OtpService(), fenix: true);
    Get.lazyPut(() => UserInfoService(), fenix: true);
    Get.lazyPut(() => MachineService(), fenix: true);
    Get.lazyPut(() => AddRecipeService(), fenix: true);

    //& Managers

    Get.put(ConnectivityManager(), permanent: true);
    Get.lazyPut(() => FirebaseManager(), fenix: true);

    //& Controllers
  }
}

Future<GetPage> _initialModule() async => machineHomePageModule;

// final loginService = LoginService.instance;

// Future<GetPage> _initialModule() async {
//   final currentUser = loginService.currentUser;

//   return currentUser != null ? recipePageModule : afterSplashModule;
// }
