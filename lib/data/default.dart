import 'package:integrations_flutter/data/service.dart';

export 'platform/platform_widget.dart';

class PlatformServiceImpl implements PlatformService {
  @override
  Future<String> callMethodChannel(String text) async {
    return 'null';
  }
}
