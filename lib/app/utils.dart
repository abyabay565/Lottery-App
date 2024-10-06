import 'dart:developer';

import 'package:flutter/foundation.dart';
import 'package:package_info_plus/package_info_plus.dart';

class GetGlobalVariable {
  static PackageInfo? packageInfo;
  static bool forceUpdate = true;
}

enum LogType { info, warning, error, success }

void debugLog(value,
    {LogType type = LogType.success, String name = "DebugLog"}) {
  if (kDebugMode) {
    switch (type) {
      case LogType.success:
        log("\x1B[32m$value\x1B[0m", name: name);
        break;
      case LogType.info:
        log("\x1B[34m$value\x1B[0m", name: name);
        break;
      case LogType.warning:
        log("\x1B[33m$value\x1B[0m", name: name);
        break;
      case LogType.error:
        log("'\x1B[31m$value\x1B[0m'", name: name);
        break;
    }
  }
}
