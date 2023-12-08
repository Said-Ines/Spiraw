// ignore_for_file: no_leading_underscores_for_local_identifiers

import '../bases/screens/exports.dart';

class StyledButton extends StatelessWidget {
  const StyledButton({
    super.key,
    this.reversed = false,
    required this.style,
    required this.title,
    this.icon,
    required this.onPressed,
    this.isLoading = false,
    this.isDisabled = false,
    this.isSocial = false,
  });

  final bool reversed;
  final ButtonStyles style;
  final String title;
  final Widget? icon;
  final VoidCallback onPressed;
  final bool isLoading;
  final bool isDisabled;
  final bool isSocial;

  @override
  Widget build(BuildContext context) {
    final _icon = icon?.visibleWhen(!isLoading) ?? const SizedBox.shrink();
    final _label = isLoading
        ? ActivityIndicator(
            backgroundColor: style.borderColor,
            color: AppColors.accent,
          ).squared(side: 18)
        : Text(
            title,
            style: !isSocial
                ? AppStyles.interboldHeadline1
                    .withSize(FontSizes.headline6)
                    .withColor(style.textColor)
                    .semiBold()
                : AppStyles.interregularTitle
                    .withSize(FontSizes.headline6)
                    .withColor(style.textColor),
          );
    return Container(
      padding: const EdgeInsets.only(bottom: 4),
      height: AppConstants.buttons.elevated.height,
      //decoration: const BoxDecoration(
      // color: style.borderColor,
      //borderRadius:
      //  BorderRadius.all(Radius.circular(AppConstants.buttons.radius)),
      //),
      child: ElevatedButton.icon(
        onPressed: onPressed,
        style: Theme.of(context).elevatedButtonTheme.style?.copyWith(
              overlayColor: MaterialStateProperty.all(AppColors.overlayColor),
              backgroundColor: MaterialStateProperty.all(
                  !isDisabled ? style.backgroundColor : AppColors.accent),
              foregroundColor: MaterialStateProperty.all(style.textColor),
              elevation: MaterialStateProperty.all(1),
              shape: MaterialStateProperty.all(
                RoundedRectangleBorder(
                  side: BorderSide(
                      width: style.borderWidth, color: style.borderColor),
                  borderRadius: BorderRadius.all(
                      Radius.circular(AppConstants.buttons.radius)),
                ),
              ),
            ),
        icon: reversed ? _label.customPadding(left: 15) : _icon,
        label: reversed ? _icon : _label,
      ).visibleWhen(true),
    );
  }
}

enum ButtonStyles {
  primary(
    textColor: AppColors.inputColor,
    backgroundColor: AppColors.secondary,
    borderColor: AppColors.inputColor,
    borderWidth: 0,
  ),
  secondary(
    textColor: AppColors.secondary,
    backgroundColor: AppColors.scaffold,
    borderColor: AppColors.secondary,
    borderWidth: 2,
  ),
  tetiary(
    textColor: AppColors.remove,
    backgroundColor: AppColors.scaffold,
    borderColor: AppColors.remove,
    borderWidth: 1.5,
  ),

  social(
    textColor: AppColors.blackTitleButton,
    backgroundColor: Colors.white,
    borderColor: AppColors.blackTitleButton,
    borderWidth: 1.5,
  );

  final Color textColor;
  final Color backgroundColor;
  final Color borderColor;
  final double borderWidth;

  const ButtonStyles({
    required this.textColor,
    required this.backgroundColor,
    required this.borderColor,
    required this.borderWidth,
  });
}
