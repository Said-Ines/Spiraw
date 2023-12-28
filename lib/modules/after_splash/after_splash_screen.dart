import 'package:spiraw/bases/screens/exports.dart';
import 'package:spiraw/modules/after_splash/after_splash_controller.dart';

class AfterSplashScreen extends GetView<AfterSplashController> {
  const AfterSplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SmartScaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 32.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Image.asset(
              AppImages.machineImage,
              width: 307,
              height: 375,
            ),
            const Gap(64),
            Observer(
                observes: controller.performingApiCall,
                builder: (context, performingApiCall) {
                  return StyledButton(
                    isLoading: performingApiCall,
                    style: ButtonStyles.primary,
                    title: "Set up your Spiraw",
                    onPressed: controller.toLoginScreen,
                  );
                }),
            const Gap(24),
            Observer(
                observes: controller.performingApiCall,
                builder: (context, performingApiCall) {
                  return StyledButton(
                    isLoading: performingApiCall,
                    style: ButtonStyles.secondary,
                    title: "Oder Spiraw",
                    onPressed: controller.toShopScreen,
                  );
                }),
          ],
        ),
      ),
    );
  }
}
