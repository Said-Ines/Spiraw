import '../../../../bases/screens/exports.dart';

class LinkTextButton extends StatelessWidget {
  const LinkTextButton({
    super.key,
    required this.title,
    required this.onTap,
  });

  final String title;
  final VoidCallback onTap;
  @override
  Widget build(BuildContext context) {
    return Text(
      title,
      style: AppFonts.inter
          .bold()
          .withSize(FontSizes.subtitle)
          .withColor(AppColors.secondary),
    )
        //.overallPadding(6)
        .onTap(onTap, overlayColor: AppColors.hint);
  }
}
