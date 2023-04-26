import 'package:flutter/services.dart';
import 'package:integrations_flutter/data/service.dart';

class PlatformServiceImpl implements PlatformService {
  static const method = MethodChannel('CALL_METHOD');

  @override
  Future<void> callMethodChannel(String text) async {
    try {
      await method.invokeMethod('CALL', [text]);
    } on PlatformException catch (e) {
      print("Failed to get value: '${e.message}'.");
    }
  }
}
