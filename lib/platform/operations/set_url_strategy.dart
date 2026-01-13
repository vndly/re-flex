import 'package:reflex/platform/platform_mobile.dart'
    if (dart.library.js_interop) 'package:reflex/platform/platform_web.dart';

class SetUrlStrategy {
  static void set() => PlatformMethods().urlStrategy();
}
