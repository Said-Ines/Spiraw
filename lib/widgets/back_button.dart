import '../../../../bases/screens/exports.dart';

class BackButton extends StatelessWidget {
  const BackButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: AppConstants.buttons.icon.size,
      width: AppConstants.buttons.icon.size,
      decoration: BoxDecoration(
        gradient: AppColors.backButtonBorderGradient,
        borderRadius: BorderRadius.circular(AppConstants.buttons.icon.radius),
      ),
      child: IconButton(
        style: IconButton.styleFrom(
          fixedSize: Size.square(AppConstants.buttons.icon.size),
          shape: RoundedRectangleBorder(
            side: const BorderSide(color: Colors.white),
            borderRadius:
                BorderRadius.circular(AppConstants.buttons.icon.radius),
          ),
        ),
        onPressed: Get.back,
        icon: Icon(
          Icons.arrow_back_ios,
          color: Colors.white,
          size: AppConstants.buttons.icon.iconSize,
        ).paddingSymmetric(horizontal: 7),
      ),
    );
  }
}
