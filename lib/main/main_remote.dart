import 'dart:async';
import 'package:flutter/material.dart';
import 'package:reflex/app/re_flex.dart';
import 'package:reflex/environments/environment_remote.dart';
import 'package:reflex/utils/error_handler.dart';
import 'package:reflex/utils/locator.dart';

void main() {
  runZonedGuarded(() async {
    await Locator.load(RemoteEnvironment());
    runApp(const ReFlex());
  }, ErrorHandler.onUncaughtError);
}
