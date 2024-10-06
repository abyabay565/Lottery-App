import 'package:flutter/cupertino.dart';
import 'package:lottery_winner/ui/bottom_sheets/notice/notice_sheet.dart';
import 'package:lottery_winner/ui/dialogs/info_alert/info_alert_dialog.dart';
import 'package:lottery_winner/ui/views/home/home_view.dart';
import 'package:lottery_winner/ui/views/startup/startup_view.dart';
import 'package:stacked/stacked_annotations.dart';
import 'package:stacked_services/stacked_services.dart';

import 'app.locator.dart';
// @stacked-import

@StackedApp(
  routes: [
    MaterialRoute(page: HomeView),
    MaterialRoute(page: StartupView),
    // @stacked-route
  ],
  dependencies: [
    LazySingleton(classType: BottomSheetService),
    LazySingleton(classType: DialogService),
    LazySingleton(classType: NavigationService),
    // @stacked-service
  ],
  bottomsheets: [
    StackedBottomsheet(classType: NoticeSheet),
    // @stacked-bottom-sheet
  ],
  dialogs: [
    StackedDialog(classType: InfoAlertDialog),
    // @stacked-dialog
  ],
)
class App {}

NavigationService get navigatorService => locator<NavigationService>();
DialogService get dialogService => locator<DialogService>();
BottomSheetService get sheetService => locator<BottomSheetService>();
GlobalKey<NavigatorState>? get navigatorKey => StackedService.navigatorKey;
