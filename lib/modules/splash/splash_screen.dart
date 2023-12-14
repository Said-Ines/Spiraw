import '../../bases/screens/exports.dart';
import '../../widgets/logo.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SmartScaffold(
      body: Stack(
        children: [
          Center(child: Image.asset(AppImages.splashImage)),
          Image.asset(
            AppImages.groupImage,
            width: 84,
            height: 84,
          ).customPadding(left: 20, top: 150),
          const Center(child: Logo())
        ],
      ),
    );
  }
}
