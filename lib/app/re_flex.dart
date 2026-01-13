import 'package:flutter/material.dart';
import 'package:reflex/app/constants.dart';
import 'package:reflex/presentation/splash/splash_screen.dart';
import 'package:reflex/utils/navigation.dart';
import 'package:reflex/utils/palette.dart';

class ReFlex extends StatelessWidget {
  const ReFlex();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Re-Flex',
      debugShowCheckedModeBanner: false,
      navigatorKey: Navigation.get.routes.key,
      theme: ThemeData(
        fontFamily: Constants.FONT_MICHROMA,
        primaryColor: Palette.PRIMARY,
        primarySwatch: Palette.PRIMARY,
        colorScheme: ColorScheme.fromSeed(seedColor: Palette.PRIMARY),
        scaffoldBackgroundColor: Palette.SCREEN_BACKGROUND,
      ),
      home: SplashScreen.instance(),
    );
  }
}
