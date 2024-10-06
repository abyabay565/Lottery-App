import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_smart_dialog/flutter_smart_dialog.dart';
import 'package:lottery_winner/app/app.router.dart';
import 'package:lottery_winner/theme/app_theme.dart';
import 'package:lottery_winner/tools/screen_size.dart';
import 'package:lottery_winner/tools/smart_dialog_config.dart';
import 'package:stacked_services/stacked_services.dart';
import 'package:statusbarz/statusbarz.dart';

import 'app/setup_dependencies.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await setupdependencies();
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
        designSize: const Size(375, 812),
        minTextAdapt: true,
        splitScreenMode: true,
        builder: (context, child) {
          return StatusbarzCapturer(
            theme: AppTheme.kcStatusbarTheme,
            child: MaterialApp(
              theme: AppTheme.theme,
              title: "Lottery Winner",
              builder: FlutterSmartDialog.init(
                builder: (context, child) {
                  ScreenSize.init(context);
                  return MediaQuery(
                      data: MediaQuery.of(context).copyWith(
                        textScaler: const TextScaler.linear(1),
                      ),
                      child: child!);
                },
                toastBuilder: toastBuilder,
                loadingBuilder: loadingBuilder,
              ),
              initialRoute: Routes.startupView,
              onGenerateRoute: StackedRouter().onGenerateRoute,
              navigatorKey: StackedService.navigatorKey,
              navigatorObservers: [
                Statusbarz.instance.observer,
                StackedService.routeObserver,
              ],
            ),
          );
        });
  }
}
