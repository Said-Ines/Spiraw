import '../../../../bases/screens/exports.dart';

class BackButton extends StatelessWidget {
  const BackButton({
    super.key,
    this.fromMachineSetup = false,
    this.fromScanning = false,
  });

  final bool fromMachineSetup;
  final bool fromScanning;

  @override
  Widget build(BuildContext context) {
    final backgroundColor = fromScanning ? Colors.white : (fromMachineSetup ? AppColors.inputColor : AppColors.transparent);
    final iconColor = fromScanning ? AppColors.inputColor : Colors.white;
    return Container(
      height: !fromScanning ? AppConstants.buttons.icon.scanningButtonSize : AppConstants.buttons.icon.size,
      width: !fromScanning ? AppConstants.buttons.icon.scanningButtonSize : AppConstants.buttons.icon.size,
      decoration: BoxDecoration(
        color: backgroundColor,
        //gradient: AppColors.backButtonBorderGradient,
        borderRadius: BorderRadius.circular(AppConstants.buttons.icon.radius),
      ),
      child: IconButton(
        style: IconButton.styleFrom(
          fixedSize: Size.square(AppConstants.buttons.icon.size),
          shape: RoundedRectangleBorder(
            side: !fromMachineSetup ? const BorderSide(color: Colors.white) : BorderSide.none,
            borderRadius: BorderRadius.circular(AppConstants.buttons.icon.radius),
          ),
        ),
        onPressed: Get.back,
        icon: Icon(
          !fromMachineSetup ? Icons.arrow_back_ios : Icons.arrow_back,
          color: iconColor,
          size: !fromScanning ? AppConstants.buttons.icon.scanningIconSize : AppConstants.buttons.icon.iconSize,
        ).paddingSymmetric(horizontal: (!fromMachineSetup) ? 7 : (fromScanning ? 12 : 0)),
      ),
    );
    //.align(alignment: !fromMachineSetup ? Alignment.topLeft : Alignment.bottomLeft);
  }
}
