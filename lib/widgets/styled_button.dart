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
    this.isFromRecipe = false,
  });

  final bool reversed;
  final ButtonStyles style;
  final String title;
  final Widget? icon;
  final VoidCallback onPressed;
  final bool isLoading;
  final bool isDisabled;
  final bool isSocial;
  final bool isFromRecipe;

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
            style: AppStyles.interSemiBoldTextButton.withColor(style.textColor),
          );
    final side = MaterialStateProperty.resolveWith<BorderSide?>((states) {
      if (isFromRecipe) {
        // Si isFromRecipe est vrai, utilisez la bordure personnalisée
        return const BorderSide(
          color: AppColors.offBlack,
          width: 2.0,
        );
      } else if (style.borderWidth > 0) {
        // Utilisez la bordure standard du style du bouton, si borderWidth > 0
        return BorderSide(
          color: style.borderColor,
          width: style.borderWidth,
        );
      }
      // Pas de bordure pour les boutons avec borderWidth == 0
      return BorderSide.none;
    });

    final shadowColor = MaterialStateProperty.resolveWith<Color>((states) {
      if (isFromRecipe) {
        return Colors.black; // Couleur de l'ombre pour le bouton isFromRecipe
      }
      return style.borderColor; // Pas d'ombre pour les autres boutons
    });

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
              backgroundColor:
                  MaterialStateProperty.all(!isDisabled ? style.backgroundColor : AppColors.accent),
              foregroundColor: MaterialStateProperty.all(style.textColor),
              elevation:
                  !isFromRecipe ? MaterialStateProperty.all(1) : MaterialStateProperty.all(4),
              shadowColor: shadowColor,
              shape: MaterialStateProperty.all(
                RoundedRectangleBorder(
                  side: BorderSide(width: style.borderWidth, color: style.borderColor),
                  borderRadius: BorderRadius.all(Radius.circular(AppConstants.buttons.radius)),
                ),
              ),
              side: side,
            ),
        icon: reversed ? _label.customPadding(left: 16) : _icon,
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
