import 'package:flutter/services.dart';

class NativeBridge {
  static const MethodChannel _channel = MethodChannel('rwad5');
  static Future<String> getNativeData() async {
    final String result = await _channel.invokeMethod('getNativeData');
    return result;
  }
}
