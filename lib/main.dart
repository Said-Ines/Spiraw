import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:spiraw/modules/all_modules.dart';

import 'app/app_widget.dart';
import 'app/colors/app_colors.dart';
import 'bases/controllers/exports.dart';
import 'environment/app_environment.dart';
import 'managers/connectivity_manager.dart';
import 'managers/firebase_manager copy.dart';

part 'main_bindings.dart';
part 'main_styling.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await _Binding.asynchronous();
  _Binding.synchronous();

  _Styling.statusBarTransparency();
  _Styling.allowedDeviceOrientations();

  AppEnvironment.setupEnvironment(
      kReleaseMode ? Environment.prod : Environment.dev);

  runApp(KingaSafetyApp(initialModule: await _initialModule()));
}
