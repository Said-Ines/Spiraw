import 'package:auto_size_text/auto_size_text.dart';

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
    return AutoSizeText(title,
            style: !isRegister
                ? AppStyles.interregularSubTitle.withColor(AppColors.secondary)
                : AppStyles.interregularSubTitle.withColor(AppColors.secondary).medium())
        //.overallPadding(6)
        .onTap(onTap, overlayColor: AppColors.blueDark);
  }
}
