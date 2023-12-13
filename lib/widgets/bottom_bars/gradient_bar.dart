import '../../bases/screens/exports.dart';
import '../../modules/core/machine_setup/controllers/scanning_template_controller.dart';

class GradientBar extends GetView<ScanningTemplateController> {
  const GradientBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: AppConstants.gradientBottomBar.gradientBottomBarHeight,
      width: double.infinity,
      decoration: const BoxDecoration(gradient: AppColors.bottomBarGradient),
      child: _CameraOption(
        switchCameraAction: () {
          controller.flipCamera();
        },
        flashAction: () {
          controller.toggleFlash();
        },
        galleryAction: () {
          controller.pickImageFromGallery();
        },
      ),
    ).align(alignment: Alignment.bottomCenter);
  }
}

class _CameraOption extends StatelessWidget {
  const _CameraOption({
    super.key,
    required this.switchCameraAction,
    required this.flashAction,
    required this.galleryAction,
  });

  final void Function()? switchCameraAction;
  final void Function()? flashAction;
  final void Function()? galleryAction;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: AppConstants.gradientBottomBar.gradientBottomBarHeight,
      width: AppConstants.gradientBottomBar.gradientBottomBarWeight,
      decoration: BoxDecoration(
          gradient: AppColors.scanningOptionsGradientBox,
          borderRadius: BorderRadius.all(Radius.circular(AppConstants.gradientBottomBar.radius)),
          border: Border.all(color: AppColors.gradientBarBorderClr, width: 2)),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          IconButton(
            onPressed: galleryAction,
            icon: Image.asset(
              AppImages.galleryIcon,
              width: AppConstants.gradientBottomBar.iconSize,
              height: AppConstants.gradientBottomBar.iconSize,
            ),
          ),
          IconButton(
            onPressed: flashAction,
            icon: Image.asset(
              AppImages.flashIcon,
              width: AppConstants.gradientBottomBar.iconSize,
              height: AppConstants.gradientBottomBar.iconSize,
            ),
          ),
          IconButton(
            onPressed: switchCameraAction,
            icon: Image.asset(
              AppImages.switchCameraIcon,
              width: AppConstants.gradientBottomBar.iconSize - 10,
              height: AppConstants.gradientBottomBar.iconSize - 10,
            ),
          ),
        ],
      ).symmetricPadding(horizontal: 15),
    );
  }
}
