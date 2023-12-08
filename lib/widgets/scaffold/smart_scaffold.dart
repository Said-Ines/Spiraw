import 'dart:io';

import '../../bases/extensions/widget_modifiers.dart';

import '../../bases/screens/exports.dart';
import '../../managers/connectivity_manager.dart';
import '../observable.dart';
import '../top_bar/top_bar.dart';
import '../vertical_spacing.dart';

part 'disconnected_widget.dart';

class SmartScaffold extends StatelessWidget {
  const SmartScaffold({
    super.key,
    this.blurredAppBar = false,
    this.applyElevationToAppBar = true,
    this.appbarBackgroundColor,
    required this.body,
    this.floatingActionButton,
    this.floatingActionButtonLocation =
        FloatingActionButtonLocation.centerDocked,
    this.bottomNavigationBar,
    this.bottomSheet,
    this.backgroundColor = AppColors.scaffold,
    this.resizeToAvoidBottomInset,
    this.extendBody = false,
    this.extendBodyBehindAppBar = false,
    this.displayBack = false,
    this.displayMenu = false,
    this.displayClose = false,
    this.appBarHeight = AppConstants.appBarHeight,
    this.title,
    this.tilteColor = Colors.white,
    this.titleStyle,
    this.leadingIconData,
    this.leadingIconColor = AppColors.primary,
    this.onLeadingPressed,
    this.actionIconData,
    this.actionIconColor = AppColors.primary,
    this.actionBackgroundColor,
    this.onActionPressed,
    this.displayAppBar = true,
    this.mainAxisAlignment = MainAxisAlignment.start,
    this.crossAxisAlignment = CrossAxisAlignment.start,
    this.formKey,
  });

  final bool blurredAppBar;

  final double appBarHeight;
  final Color? appbarBackgroundColor;
  final bool applyElevationToAppBar;
  final Widget body;
  final bool extendBody;
  final bool extendBodyBehindAppBar;
  final Widget? floatingActionButton;
  final FloatingActionButtonLocation? floatingActionButtonLocation;
  final Color backgroundColor;
  final Widget? bottomNavigationBar;
  final Widget? bottomSheet;
  final bool? resizeToAvoidBottomInset;

  final bool displayBack;
  final bool displayMenu;
  final bool displayClose;

  final String? title;
  final Color? tilteColor;
  final TextStyle? titleStyle;

  final IconData? actionIconData;
  final void Function()? onLeadingPressed;
  final bool displayAppBar;
  final IconData? leadingIconData;
  final Color? leadingIconColor;
  final Color? actionBackgroundColor;
  final Color? actionIconColor;
  final void Function()? onActionPressed;
  final MainAxisAlignment mainAxisAlignment;
  final CrossAxisAlignment crossAxisAlignment;
  final GlobalKey? formKey;

  @override
  Widget build(BuildContext context) => Observer(
        observes: Get.find<ConnectivityManager>().connectionStateObs,
        builder: (_, final bool isConnected) => !isConnected
            ? const _DisconnectedWidget()
            : GestureDetector(
                onTap: FocusScope.of(context).unfocus,
                child: Scaffold(
                  extendBody: extendBody,
                  extendBodyBehindAppBar: extendBodyBehindAppBar,
                  key: key,
                  appBar: displayAppBar
                      ? TopBar(
                          blurred: blurredAppBar,
                          appBarHeight: appBarHeight,
                          applyElevation: applyElevationToAppBar,
                          appBarBackgroundColor: appbarBackgroundColor,
                          displayBack: displayBack,
                          displayMenu: displayMenu,
                          displayClose: displayClose,
                          title: title ?? "",
                          titleColor: tilteColor,
                          titleStyle: titleStyle,
                          leadingIconData: leadingIconData,
                          leadingIconColor: leadingIconColor,
                          onLeadingPressed: onLeadingPressed,
                          actionIconData: actionIconData,
                          actionIconColor: actionIconColor,
                          actionBackgroundColor: actionBackgroundColor,
                          onActionPressed: onActionPressed,
                        )
                      : null,
                  body: body,
                  floatingActionButton: floatingActionButton,
                  floatingActionButtonLocation: floatingActionButtonLocation ??
                      (Platform.isIOS
                          ? FloatingActionButtonLocation.endDocked
                          : FloatingActionButtonLocation.endFloat),
                  bottomSheet: bottomSheet,
                  backgroundColor: backgroundColor,
                  resizeToAvoidBottomInset: resizeToAvoidBottomInset,
                  bottomNavigationBar: bottomNavigationBar,
                ),
              ),
      );
}
