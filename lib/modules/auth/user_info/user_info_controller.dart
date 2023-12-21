import 'package:firebase_auth/firebase_auth.dart';

import '../../../bases/controllers/exports.dart';
import '../data/model/user_model.dart';
import '../phone_login/phone_login_controller.dart';
import 'user_info_service.dart';

class UserInfoController extends GetxController {
  final performingApiCall = Observable(false);

  final inputControls = InputControl.generate(3);
  final formKey = GlobalKey<FormState>();

  final userInfoService = UserInfoService();

  void userValidate() async {
    if (!formKey.isValid) return;
    // Retrieve information from the controller
    final String firstName = inputControls.first.controller.text.trim();
    final String lastName = inputControls.second.controller.text.trim();
    final String email = inputControls.last.controller.text.trim();

    final String phoneNumber = Get.find<PhoneLoginController>().getPhoneNumber();

    // Get the current user from Firebase Auth
    User? currentUser = FirebaseAuth.instance.currentUser;

    // Save information to Database
    if (currentUser != null) {
      await userInfoService.saveUsertoDatabase(
        UserModel(
          uid: currentUser.uid,
          firstName: firstName,
          lastName: lastName,
          email: email,
          phoneNumber: phoneNumber,
          userImage: '',
        ),
      );
      Get.offNamed(getStartedModule.name);
    } else {
      Get.snackbar('Error', 'Something went wrong');
    }
  }

  void back() {
    Get.back();
  }

  @override
  void onClose() {
    inputControls.disposeAll();

    super.onClose();
  }
}
