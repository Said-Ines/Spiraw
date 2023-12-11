import 'dart:ui';

import '../../bases/screens/exports.dart';

class TopBar extends StatelessWidget implements PreferredSizeWidget {
  const TopBar({
    super.key,
    required this.blurred,
    required this.appBarHeight,
    required this.applyElevation,
    this.appBarBackgroundColor,
    required this.title,
    this.titleColor,
    this.titleStyle,
    required this.displayBack,
    required this.displayClose,
    required this.displayMenu,
    this.leadingIconData,
    this.leadingIconColor,
    this.onLeadingPressed,
    this.actionIconData,
    this.actionIconColor,
    this.actionBackgroundColor,
    this.onActionPressed,
  });

  final bool blurred;

  final double appBarHeight;
  final bool applyElevation;
  final Color? appBarBackgroundColor;

  final String title;
  final Color? titleColor;
  final TextStyle? titleStyle;

  final bool displayBack;
  final bool displayMenu;
  final bool displayClose;

  final IconData? leadingIconData;
  final Color? leadingIconColor;
  final void Function()? onLeadingPressed;

  final IconData? actionIconData;
  final Color? actionIconColor;

  final Color? actionBackgroundColor;
  final void Function()? onActionPressed;

  @override
  Size get preferredSize => Size.fromHeight(appBarHeight - MediaQuery.of(Get.context!).padding.top);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      toolbarHeight: appBarHeight,
      elevation: applyElevation ? AppConstants.appBarElevation : 0,
      automaticallyImplyLeading: false,
      backgroundColor:
          blurred ? Colors.white.withAlpha(1) : appBarBackgroundColor ?? Theme.of(context).appBarTheme.backgroundColor,
      flexibleSpace: blurred
          ? ClipRect(
              child: BackdropFilter(
              blendMode: BlendMode.srcOver,
              filter: ImageFilter.blur(sigmaX: 3, sigmaY: 3),
              child: Container(color: Colors.transparent),
            ))
          : null,
      leading: leadingIconData != null
          ? IconButton(
              onPressed: onLeadingPressed,
              icon: Icon(
                leadingIconData,
                color: leadingIconColor,
              ),
            )
          : displayBack
              ? IconButton(
                  onPressed: Get.back,
                  icon: Icon(
                    Icons.arrow_back_rounded,
                    color: leadingIconColor,
                  ),
                )
              : null,
      leadingWidth: AppConstants.appBarButtonWidth,
      title: Row(
        children: [
          Container(
            margin: const EdgeInsets.only(left: AppConstants.bodyMinSymetricHorizontalPadding, right: 8),
            width: 48,
            height: 48,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8),
              color: AppColors.primary,
            ),
            child: const Text(
              "DO",
              //style: AppFonts.helvetica.bold().withColor(AppColors.scaffold).withSize(FontSizes.headline3),
            ).center(),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                "Hello Doug!",
                // style: AppFonts.helvetica.bold().withSize(FontSizes.subtitle),
              ).customPadding(left: 3, bottom: 2),
              const Row(
                children: [
                  Icon(
                    Icons.location_on,
                    size: 20,
                  ),
                  Text(
                    "Cicago, IL",
                    //style: AppFonts.helvetica.regular().withSize(FontSizes.indication),
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
      centerTitle: true,
      actions: [
        if (displayMenu)
          IconButton(
            icon: Icon(
              Icons.menu_rounded,
              color: actionIconColor,
              size: 30,
            ),
            onPressed: () {
              FocusScope.of(context).unfocus();
              //Get.toNamed(menuModule.name);
            },
          ).customPadding(right: 15),
        if (displayClose)
          IconButton(
            icon: Icon(
              Icons.close,
              color: actionIconColor,
              size: 30,
            ),
            onPressed: () {
              FocusScope.of(context).unfocus();
              Get.back();
            },
          ).customPadding(right: 15),
        if (actionIconData != null)
          IconButton(
            onPressed: onActionPressed ?? () {},
            icon: Icon(
              actionIconData,
              color: actionIconColor,
            ),
          ).resize(width: AppConstants.appBarButtonWidth)
      ],
      titleSpacing: 0,
    );
  }
}
