import '../bases/screens/exports.dart';

class Utils {
  static String extractFirebaseError(String error) {
    return error.substring(error.indexOf(']') + 1);
  }

  static void showSnackBar(String title, String message) {
    Get.showSnackbar(
      GetSnackBar(
        backgroundColor: AppColors.primary.withOpacity(.4),
        title: title,
        isDismissible: true,
        duration: const Duration(milliseconds: 2000),
        message: message,
        snackPosition: SnackPosition.BOTTOM,
        borderRadius: 20,
        margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
        snackStyle: SnackStyle.GROUNDED,
        barBlur: 30,
      ),
    );
  }
}
