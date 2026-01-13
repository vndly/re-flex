import 'dart:ui';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_crashlytics/firebase_crashlytics.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:reflex/environments/environment.dart';
import 'package:reflex/platform/operations/set_url_strategy.dart';
import 'package:reflex/presentation/audio/audio.dart';
import 'package:reflex/utils/navigation.dart';
import 'package:reflex/utils/platform.dart';

final GetIt locator = GetIt.instance;

class Locator {
  static Future load(Environment environment) async {
    WidgetsFlutterBinding.ensureInitialized();

    if (Platform.isWeb) {
      await Firebase.initializeApp(
        options: const FirebaseOptions(
          apiKey: 'AIzaSyDG0fBH8xlnmF2nCP_9vWfGE610DWNazNw',
          authDomain: 're-flex.firebaseapp.com',
          projectId: 're-flex',
          storageBucket: 're-flex.firebasestorage.app',
          messagingSenderId: '334010089268',
          appId: '1:334010089268:web:ffd0a8875009d24dbaaf61',
          measurementId: 'G-PV5MSCQ1R5',
        ),
      );
    } else {
      await Firebase.initializeApp();

      await FirebaseCrashlytics.instance.setCrashlyticsCollectionEnabled(true);
      FlutterError.onError = FirebaseCrashlytics.instance.recordFlutterError;
      PlatformDispatcher.instance.onError = (error, stack) {
        FirebaseCrashlytics.instance.recordError(error, stack, fatal: true);
        return true;
      };
    }

    SetUrlStrategy.set();

    locator.registerSingleton<Environment>(environment);
    locator.registerSingleton<Navigation>(Navigation());
    locator.registerSingleton<Audio>(Audio());

    await environment.configure();
  }
}
