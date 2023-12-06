// import 'package:geolocator/geolocator.dart';

// import '../bases/screens/exports.dart';
// import '../modules/menu/hamburger_menu_controller.dart';

// final alertManager = Get.find<AlertsManager>();

// class AlertsManager {
//   Future<String?> displayAlert({
//     final String? title,
//     required final String message,
//     final String firstButtonTitle = "OK",
//     void Function()? firstButtonAction,
//     final bool withSecondaryButton = false,
//     final String? secondButtonTitle,
//     void Function()? secondButtonAction,
//     bool barrierDismissible = true,
//   }) async {
//     await hamburgerMenuController.closeDrawer();
//     return Get.dialog(
//       AlertDialog(
//         shadowColor: AppColors.secondary.withOpacity(.1),
//         shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(AppValues.defaultRadius)),
//         insetPadding: const EdgeInsets.symmetric(horizontal: AppValues.bodyMaxSymetricHorizontalPadding),
//         alignment: Alignment.center,
//         actionsAlignment: MainAxisAlignment.center,
//         backgroundColor: AppColors.scaffoldColor,
//         iconPadding: EdgeInsets.zero,
//         title: title != null
//             ? Text(
//                 title,
//                 textAlign: TextAlign.center,
//               )
//             : null,
//         titleTextStyle: AppStyles.alertTitle,
//         content: Text(
//           message,
//           textAlign: TextAlign.center,
//         ),
//         contentTextStyle: AppStyles.alertMessage,
//         buttonPadding: const EdgeInsets.symmetric(horizontal: AppValues.bodyMinSymetricHorizontalPadding),
//         titlePadding: const EdgeInsets.only(top: 48),
//         actionsPadding: const EdgeInsets.only(bottom: 40),
//         actions: <Widget>[
//           Row(
//             mainAxisAlignment: MainAxisAlignment.center,
//             children: [
//               if (withSecondaryButton)
//                 if (withSecondaryButton)
//                   Card(
//                     child: Text(
//                       secondButtonTitle ?? "",
//                       style: AppStyles.alertButton.copyWith(color: AppColors.primaryShape),
//                     ).center().onTap(
//                       () {
//                         Navigator.of(Get.overlayContext!).pop();
//                         if (secondButtonAction != null) secondButtonAction.call();
//                       },
//                     ),
//                   ).resize(height: AppValues.alertButtonHeight).flexible(flex: 1),
//               if (withSecondaryButton) const HorizontalSpacing(10),
//               Card(
//                 color: AppColors.primary,
//                 child: Text(
//                   firstButtonTitle,
//                   style: AppStyles.alertButton,
//                 ).center().onTap(() {
//                   Navigator.of(Get.overlayContext!).pop();
//                   if (firstButtonAction != null) firstButtonAction.call();
//                 }),
//               ).resize(height: AppValues.alertButtonHeight).flexible(flex: 1),
//             ],
//           ).symmetricPadding(horizontal: AppValues.bodyMaxSymetricHorizontalPadding - 10),
//         ],
//       ),
//     );
//   }

//   void displaySnackBar({
//     required SnackBarType type,
//     SnackBarTypeTheme theme = SnackBarTypeTheme.light,
//     bool? isDismissible = true,
//     required final String title,
//     required final String message,
//     Duration duration = const Duration(seconds: 5),
//     String? actionTitle,
//     void Function()? onPressed,
//     void Function(SnackbarStatus?)? snackbarStatus,
//     bool showProgressIndicator = false,
//     bool diplayVerticalLeadingIndicator = false,
//   }) async {
//     await Get.closeCurrentSnackbar();

//     Get.snackbar(
//       "",
//       "",
//       isDismissible: isDismissible,
//       snackStyle: SnackStyle.FLOATING,
//       snackPosition: SnackPosition.BOTTOM,
//       borderColor: type.color,
//       borderWidth: .2,
//       overlayBlur: 3,
//       barBlur: 10,
//       duration: duration,
//       animationDuration: const Duration(milliseconds: 300),
//       margin: EdgeInsets.only(
//         left: AppValues.bodyMinSymetricHorizontalPadding * (actionTitle == null ? 1 : .6),
//         right: AppValues.bodyMinSymetricHorizontalPadding * (actionTitle == null ? 1 : .6),
//         bottom: GetPlatform.isAndroid ? 30 : 0,
//       ),
//       snackbarStatus: snackbarStatus,
//       progressIndicatorBackgroundColor: AppColors.warningColor.withOpacity(.5),
//       borderRadius: AppValues.defaultRadius,
//       padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 10),
//       showProgressIndicator: showProgressIndicator,
//       leftBarIndicatorColor: showProgressIndicator
//           ? null
//           : diplayVerticalLeadingIndicator
//               ? type.color
//               : null,
//       titleText: Text(
//         title,
//         style: theme == SnackBarTypeTheme.light ? AppStyles.snackbarTitle : AppStyles.snackbarTitleDark,
//       ),
//       messageText: Text(
//         message,
//         style: theme == SnackBarTypeTheme.light ? AppStyles.snackbarMessage : AppStyles.snackbarMessageDark,
//       ),
//       mainButton: actionTitle == null
//           ? null
//           : TextButton(
//               onPressed: onPressed,
//               child: Text(
//                 actionTitle,
//                 style: theme == SnackBarTypeTheme.light ? AppStyles.snackbarButton : AppStyles.snackbarButtonDark,
//               )),
//       icon: Icon(
//         type.icon,
//         color: type.color,
//       ),
//     );
//   }
// }

// extension PermissionExt on AlertsManager {
//   void locationPermissionNotGrantedSnackbar() => displaySnackBar(
//         type: SnackBarType.error,
//         title: "Permission Denied",
//         message: "Location permission is required to use this app.",
//         actionTitle: "Allow",
//         onPressed: Geolocator.openLocationSettings,
//       );

//   void displayDiskAccessAuthorizationAlert() => displaySnackBar(
//         type: SnackBarType.error,
//         title: 'Disk access is denied',
//         message: 'Please grant disk access to allow Rides2U to save/select files',
//         actionTitle: "Allow",
//         onPressed: Geolocator.openAppSettings,
//       );

//   void displayCameraUsageAuthorizationAlert() => displaySnackBar(
//         type: SnackBarType.error,
//         title: 'Camera usage is denied',
//         message: 'Please authorize the use of the camera to allow Rides2U to take photos',
//         actionTitle: "Allow",
//         onPressed: Geolocator.openAppSettings,
//       );

//   void displayConfirmationAlert({
//     required final String message,
//     required void Function() onConfirm,
//   }) =>
//       displayAlert(
//         title: "Confirmation",
//         message: message,
//         firstButtonTitle: "Yes",
//         firstButtonAction: onConfirm,
//         secondButtonTitle: "No",
//         barrierDismissible: true,
//       );
// }

// enum SnackBarType {
//   info(AppColors.primary, Icons.info),
//   success(AppColors.successColor, Icons.check),
//   warning(AppColors.warningColor, Icons.warning),
//   error(AppColors.errorColor, Icons.error);

//   final Color color;
//   final IconData icon;

//   const SnackBarType(this.color, this.icon);
// }

// enum SnackBarTypeTheme { light, dark }
