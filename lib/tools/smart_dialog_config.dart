import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../model/basics_response_model.dart';
import '../theme/app_color.dart';
import 'blur_background.dart';
import 'custom_loading.dart';


Widget loadingBuilder(String message) {
  return BlurBackground(
    blur: 3,
    borderRadius: 12,
    child: Container(
      padding: EdgeInsets.symmetric(horizontal: 30.w, vertical: 30.h),
      decoration: BoxDecoration(
        color: Colors.white.withOpacity(0.12),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          const CustomLoading(),
          Visibility(
            visible: message.isNotEmpty,
            child: Container(
              margin: EdgeInsets.only(top: 10.h),
              child: Text(
                message,
                style: const TextStyle(
                  color: Colors.white,
                  fontStyle: FontStyle.italic,
                ),
              ),
            ),
          ),
        ],
      ),
    ),
  );
}

Widget toastBuilder(String message) {
  var toast = ToastModel.fromString(message);
  return Align(
    alignment: Alignment.bottomCenter,
    child: Container(
      margin: const EdgeInsets.symmetric(horizontal: 30, vertical: 50),
      padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 10),
      decoration: BoxDecoration(
        color: toast.type.toColor,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Text(
        toast.message,
        style: const TextStyle(
          color: Palette.white,
          fontStyle: FontStyle.italic,
        ),
      ),
    ),
  );
}
