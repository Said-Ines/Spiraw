import '../bases/screens/exports.dart';

class Logo extends StatelessWidget {
  const Logo({
    super.key,
  });
  @override
  Widget build(BuildContext context) {
    return Text(
      "SPIRAW.",
      style: AppStyles.interboldHeadline1.withSize(FontSizes.splashTitle).withColor(AppColors.secondary),
    );
  }
}
