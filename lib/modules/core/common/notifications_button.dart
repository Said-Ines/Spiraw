import '../../../bases/screens/exports.dart';

class NotificationsButton extends StatelessWidget {
  const NotificationsButton({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: AppConstants.buttons.icon.size,
      height: AppConstants.buttons.icon.size,
      decoration: BoxDecoration(
        color: Colors.white.withOpacity(0.18),
        borderRadius: BorderRadius.circular(8),
      ),
      child: IconButton(
        color: AppColors.greyDark,
        icon: Image.asset(
          AppImages.notificationIcon,
          width: AppConstants.buttons.icon.iconSize,
          height: AppConstants.buttons.icon.iconSize,
        ),
        onPressed: () {},
      ).center(),
    );
  }
}
