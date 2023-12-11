import '../../bases/screens/exports.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SmartScaffold(
      displayAppBar: false,
      body: Stack(
        children: [
          Center(child: Image.asset(AppImages.splashImage)),
          Image.asset(
            AppImages.groupImage,
            width: 84,
            height: 84,
          ).customPadding(left: 20, top: 150),
          Center(
            child: Text(
              "SPIRAW.",
              style: AppStyles.interboldHeadline1.withSize(FontSizes.splashTitle).withColor(AppColors.secondary),
            ),
          )
        ],
      ),
    );
  }
}
