import '../../../../bases/screens/exports.dart';

class LinkTextButton extends StatelessWidget {
  const LinkTextButton({
    super.key,
    required this.title,
    required this.onTap,
    this.isRegister = false,
  });

  final String title;
  final VoidCallback onTap;
  final bool isRegister;

  @override
  Widget build(BuildContext context) {
    return Text(title,
            style: !isRegister
                ? AppStyles.interregularSubTitle.withColor(AppColors.secondary)
                : AppStyles.interboldHeadline3.withColor(AppColors.secondary).withSize(FontSizes.subtitle))
        //.overallPadding(6)
        .onTap(onTap, overlayColor: AppColors.blueDark);
  }
}
