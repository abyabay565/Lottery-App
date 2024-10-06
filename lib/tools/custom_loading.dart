import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../theme/app_color.dart';

class CustomLoading extends StatelessWidget {
  const CustomLoading({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 25.h,
      width: 25.w,
      child: CircularProgressIndicator(
        strokeWidth: 3.w,
        backgroundColor: Palette.primary,
        color: Palette.primary,
      ),
    );
    // Lottie.asset(
    //   "assets/images/lottie/loading.json",
    //   height: 80.h,
    // );
  }
}
