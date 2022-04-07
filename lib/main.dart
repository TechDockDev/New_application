// ignore_for_file: unnecessary_null_comparison

import 'package:easy_localization/easy_localization.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:new_application/myapp.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  await EasyLocalization.ensureInitialized();
  runApp(
    EasyLocalization(
      path: 'assets/translations',
      supportedLocales: const [
        Locale('english'),
        Locale('french'),
        Locale('german'),
        Locale('hebrew'),
      ],
      fallbackLocale: const Locale('english'),
      child: const MyApp(),
    ),
  );
}
