import 'dart:convert';

import '../constants/app_constants.dart';

class BasicResponse {
  int? errorCode;
  Map<String, dynamic>? map;
  List<Map<String, dynamic>?>? listOfMap;
  List<dynamic>? dynamiclist;
  String? message;
  bool? toast;

  BasicResponse({
    this.errorCode,
    this.map,
    this.message,
    this.toast,
    this.dynamiclist,
    this.listOfMap,
  });

  factory BasicResponse.fromJson(Map<String, dynamic> json) {
    dynamic dataType = json['data'];
    if (dataType is Map) {
      return BasicResponse(
        errorCode: json["error_code"],
        message: json["message"],
        map: dataType as Map<String, dynamic>,
        toast: json["toast"],
      );
    } else {
      List listTypeData = json['data'];
      if (listTypeData.any((element) => element is Map<String, dynamic>)) {
        return BasicResponse(
          errorCode: json["error_code"],
          message: json["message"],
          listOfMap: dataType?.cast<Map<String, dynamic>>(),
          toast: json["toast"],
        );
      } else {
        return BasicResponse(
          errorCode: json["error_code"],
          message: json["message"],
          dynamiclist: dataType,
          toast: json["toast"],
        );
      }
    }
  }

  Map<String, dynamic> toJson() => {
        "error_code": errorCode,
        "data": map,
        "message": message,
        "toast": toast,
      };
}

class ToastModel {
  late String message;
  late ToastType type;
  late bool showToast;

  ToastModel({
    required this.message,
    required this.type,
    required this.showToast,
  });

  ToastModel.fromBasicResponse(BasicResponse response) {
    message = response.message ?? "";
    type = ToastType.fromValue(response.errorCode);
    showToast = response.toast ?? false;
  }

  ToastModel.fromJson(Map<String, dynamic> json) {
    message = json['message'] ?? "";
    type = ToastType.fromValue(json['type']);
    showToast = json['toast'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['message'] = message;
    data['type'] = type.value;
    data['toast'] = showToast;
    return data;
  }

  @override
  String toString() {
    return jsonEncode(toJson());
  }

  ToastModel.fromString(String data) {
    var toast = ToastModel.fromJson(jsonDecode(data));
    message = toast.message;
    type = toast.type;
    showToast = toast.showToast;
  }
}
