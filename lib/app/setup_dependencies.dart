import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';
import 'package:lottery_winner/app/utils.dart';
import 'package:package_info_plus/package_info_plus.dart';

import '../constants/assets.gen.dart';
import 'app.bottomsheets.dart';
import 'app.dialogs.dart';
import 'app.locator.dart';

Future<void> setupdependencies() async {
  try {
    /*await Firebase.initializeApp(
        options: DefaultFirebaseOptions.currentPlatform);*/
    // Setup Stack Dependencies
    await setupLocator();
    setupDialogUi();
    setupBottomSheetUi();
    GetGlobalVariable.packageInfo = await PackageInfo.fromPlatform();
    // Setup DeviceOrientation
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);
    // Setup LetsEncrypt
    if (!kIsWeb) {
      if (Platform.isAndroid) {
        ByteData data = await PlatformAssetBundle().load(
          Assets.certificate.letsEncryptR3,
        );
        SecurityContext.defaultContext.setTrustedCertificatesBytes(
          data.buffer.asUint8List(),
        );
      }
    }

    // Setup Internet checker
    //await InternetConnectionCheckerService.instance.start();

    // Setup Notification
    //NotificationService.instance.setupFlutterNotifications();
    //   ..onBackgroundMessage(firebaseMessagingBackgroundHandler);
  } on Exception catch (e) {
    debugLog(
      e,
      name: "Main exception catch",
      type: LogType.error,
    );
  }
}
