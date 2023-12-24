import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'app/app_widget.dart';
import 'app/colors/app_colors.dart';
import 'bases/controllers/exports.dart';
import 'environment/app_environment.dart';
import 'firebase_options.dart';
import 'managers/connectivity_manager.dart';
import 'managers/firebase_manager.dart';
import 'modules/auth/otp/otp_service.dart';
import 'modules/auth/phone_login/phone_login_service.dart';
import 'modules/auth/user_info/user_info_service.dart';

part 'main_bindings.dart';
part 'main_styling.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  FlutterNativeSplash.preserve(widgetsBinding: WidgetsBinding.instance);

  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  FirebaseFirestore.instance.settings = const Settings(persistenceEnabled: true);
  FlutterNativeSplash.remove();

  await _Binding.asynchronous();
  _Binding.synchronous();

  _Styling.statusBarTransparency();
  _Styling.allowedDeviceOrientations();

  AppEnvironment.setupEnvironment(kReleaseMode ? Environment.prod : Environment.dev);

  runApp(SpirawApp(initialModule: await _initialModule()));
}
