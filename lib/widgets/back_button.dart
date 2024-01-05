import '../../../../bases/screens/exports.dart';

class BackButton extends StatelessWidget {
  const BackButton({
    Key? key,
    this.fromMachineSetup = false,
    this.fromScanning = false,
  }) : super(key: key);

  final bool fromMachineSetup;
  final bool fromScanning;

  @override
  Widget build(BuildContext context) {
    final backgroundColor = fromScanning ? Colors.white : (fromMachineSetup ? AppColors.inputColor : AppColors.transparent);
    final iconColor = fromScanning ? AppColors.inputColor : Colors.white;
    return Container(
      height: fromScanning ? AppConstants.buttons.back.scanningButtonSize : AppConstants.buttons.back.size,
      width: fromScanning ? AppConstants.buttons.back.scanningButtonSize : AppConstants.buttons.back.size,
      decoration: BoxDecoration(
        color: backgroundColor,
        borderRadius: BorderRadius.circular(AppConstants.buttons.back.radius),
      ),
      child: IconButton(
        style: IconButton.styleFrom(
          fixedSize: Size.square(AppConstants.buttons.back.size),
          shape: RoundedRectangleBorder(
            side: !fromMachineSetup ? const BorderSide(color: Colors.white) : BorderSide.none,
            borderRadius: BorderRadius.circular(AppConstants.buttons.back.radius),
          ),
        ),
        onPressed: Get.back,
        icon: Icon(
          fromMachineSetup ? Icons.arrow_back : Icons.arrow_back_ios,
          color: iconColor,
          size: fromScanning ? AppConstants.buttons.back.scanningIconSize : AppConstants.buttons.back.iconSize,
        ).paddingSymmetric(horizontal: fromScanning ? 7 : (fromMachineSetup ? 0 : 12)),
      ),
    );
  }
}
