import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../managers/connectivity_manager.dart';

import '../modules/all_modules.dart';
import 'index.dart';

class KingaSafetyApp extends StatelessWidget {
  final GetPage initialModule;

  KingaSafetyApp({
    super.key,
    required this.initialModule,
  }) {
    Get.find<ConnectivityManager>().startMonitoring();
    // AppEnvironment.performEnvironmentAssertions();
  }

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      enableLog: false,

      //$ Theme Management
      themeMode: ThemeMode.light,
      theme: AppThemes.darkTheme,
      darkTheme: AppThemes.darkTheme,

      //? Routing Transition
      defaultTransition: Transition.cupertino,
      opaqueRoute: true,

      //@ Routing
      initialRoute:
          //initialModule.name,
          designSystemModule.name,
      getPages: [
        //! Desing System
        designSystemModule,

        // //* Auth
        // phoneSignupModule,
        // otpModule,
        // userInfoModule,
        // emailSignupModule,
        // signinModule,

        // //? Setup
        // setupModule,
        // emergencyCallingModule,
        // stayConnectedModule,
        // messageSetupModule,
        // decoyCallModule,
        // micAccessModule,

        // //$ Home
        // homeModule,

        // //& Menu
        // menuModule,
      ],
    );
  }
}
