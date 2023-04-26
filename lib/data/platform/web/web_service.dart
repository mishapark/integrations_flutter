import 'package:integrations_flutter/data/service.dart';

import 'web_interop.dart';

class PlatformServiceImpl implements PlatformService {
  final _manager = InteropManager();

  @override
  Future<void> callMethodChannel(String text) async {
    _manager.setValueToJs(text);
  }
}
