import 'dart:io';

import 'package:device_info_plus/device_info_plus.dart';

class DeviceInfoHelper {
  DeviceInfoHelper._();

  static DeviceInfoHelper? _instance;

  static IosDeviceInfo? _iosDeviceInfo;

  static AndroidDeviceInfo? _androidDeviceInfo;

  // ignore: prefer_constructors_over_static_methods
  static DeviceInfoHelper get instance {
    assert(_instance != null, 'Call `initialize()` first');
    return _instance!;
  }

  bool get isIPad {
    if (_iosDeviceInfo == null) return false;
    return _iosDeviceInfo?.model?.toLowerCase() == 'ipad';
  }

  Map<String, dynamic> get infoMap {
    return _iosDeviceInfo?.toMap() ?? _androidDeviceInfo!.toMap();
  }

  String get deviceId =>
      _iosDeviceInfo?.identifierForVendor ?? _androidDeviceInfo!.androidId!;

  int? get androidSdk => _androidDeviceInfo?.version.sdkInt;

  static Future<void> initialize() async {
    if (_instance != null) return;
    _instance = DeviceInfoHelper._();
    final deviceInfo = DeviceInfoPlugin();
    if (Platform.isIOS) {
      _iosDeviceInfo = await deviceInfo.iosInfo;
      return;
    }
    _androidDeviceInfo = await deviceInfo.androidInfo;
    return;
  }
}
