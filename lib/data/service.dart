import 'default.dart'
    if (dart.library.html) 'platform/web/web_service.dart'
    if (dart.library.io) 'platform/android/android_service.dart';

abstract class PlatformService {
  Future<void> callMethodChannel(String text);
}

PlatformService getService() {
  return PlatformServiceImpl();
}
