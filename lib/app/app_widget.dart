import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../managers/connectivity_manager.dart';
import '../modules/all_modules.dart';
import '../widgets/bottom_bars/gradient_bar_module.dart';
import 'index.dart';

class SpirawApp extends StatelessWidget {
  final GetPage initialModule;

  SpirawApp({
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
      initialRoute: initialModule.name,
      getPages: [
        //! Desing System
        designSystemModule,

        //$ Splash
        splashModule,
        afterSplashModule,

        //* Auth
        phoneLoginModule,
        userInfoModule,
        otpModule,
        userInfoModule,
        signupModule,
        otpModule,
        // emailSignupModule,
        loginModule,

        //? Machine Auth
        getStartedModule,
        scannerModule,
        successModule,
        gradientBarModule,

        //& Machine Setup
        addWaterModule,
        scanningSupplementModule,
        scanningTemplateModule,
        successTemplateModule,
        supplementAddedModule,
        scanningStarterModule,
        starterAddedModule,
        disinfinctionModule,
        disinfinctionSuccessModule,
        wellDoneModule,

        //$ Community Home Page
        addRecipeModule,
        recipeCategoriesModule,
        timeSpentModule,
        ingredientsModule,
        addIngredientsModule,
        recipePageModule,
        ingredientsAfterAddModule,

        //? Machine Home Page
        machineHomePageModule,
        spirulinaGrowthModule,
        ecoImpactModule,
      ],
    );
  }
}
