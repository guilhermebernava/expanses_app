import 'package:expenzio/app/base_app.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'firebase_options.dart';

void main() async {
  await dotenv.load();
  final app = await Firebase.initializeApp(
      options: DefaultFirebaseOptions.currentPlatform);
  FirebaseAuth.instanceFor(app: app);

  runApp(App());
}
