// ignore_for_file: depend_on_referenced_packages
import 'package:expenzio/app/base_app.dart';
import 'package:flutter/material.dart';
import 'package:common_dependencies/common_dependencies.dart';

import 'firebase_options.dart';

void main() async {
  await dotenv.load();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  runApp(App());
}
