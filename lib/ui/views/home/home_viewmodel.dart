import 'package:flutter/material.dart';
import 'package:lottery_winner/app/app.bottomsheets.dart';
import 'package:lottery_winner/app/app.dialogs.dart';
import 'package:lottery_winner/app/app.locator.dart';
import 'package:lottery_winner/ui/common/app_strings.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

class HomeViewModel extends BaseViewModel {
  final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();
  final _dialogService = locator<DialogService>();
  final _bottomSheetService = locator<BottomSheetService>();
  List<HomeModel> homeData = [
    HomeModel(id: 1,expandable: false,expandData: [],icon: "",isClicked: false,name: "Bookings"),
    HomeModel(id: 2,expandable: true,expandData: [
      HomeExpandData(id: 1,name: "B1",icon: ""),
      HomeExpandData(id: 2,name: "B2",icon: ""),
      HomeExpandData(id: 3,name: "B3",icon: ""),
      HomeExpandData(id: 4,name: "B4",icon: ""),
    ],icon: "",isClicked: false,name: "Change Game"),
    HomeModel(id: 3,expandable: false,expandData: [],icon: "",isClicked: false,name: "Reports"),
    HomeModel(id: 4,expandable: false,expandData: [],icon: "",isClicked: false,name: "Total Count View"),
    HomeModel(id: 5,expandable: false,expandData: [],icon: "",isClicked: false,name: "Edit,Delete Bill"),
    HomeModel(id: 6,expandable: false,expandData: [],icon: "",isClicked: false,name: "Result View"),
    HomeModel(id: 7,expandable: false,expandData: [],icon: "",isClicked: false,name: "Settings"),
    HomeModel(id: 8,expandable: false,expandData: [],icon: "",isClicked: false,name: "Agent Settings"),
    HomeModel(id: 9,expandable: false,expandData: [],icon: "",isClicked: false,name: "App Updation"),
  ];

  String get counterLabel => 'Counter is: $_counter';

  int _counter = 0;

  void incrementCounter() {
    _counter++;
    rebuildUi();
  }

  void showDialog() {
    _dialogService.showCustomDialog(
      variant: DialogType.infoAlert,
      title: 'Stacked Rocks!',
      description: 'Give stacked $_counter stars on Github',
    );
  }

  void showBottomSheet() {
    _bottomSheetService.showCustomSheet(
      variant: BottomSheetType.notice,
      title: ksHomeBottomSheetTitle,
      description: ksHomeBottomSheetDescription,
    );
  }
}

class HomeModel {
  int? id;
  bool? expandable;
  bool? isClicked;
  String? name;
  String? icon;
  List<HomeExpandData>?  expandData;

  HomeModel({this.id,this.expandable,this.name,this.icon,this.expandData,this.isClicked,});

}
class HomeExpandData {
  int? id;
  String? name;
  String? icon;
  HomeExpandData({this.id,this.name,this.icon});
}
