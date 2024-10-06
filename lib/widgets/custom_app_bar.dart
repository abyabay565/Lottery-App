import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../app/app.dart';
import '../theme/app_color.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  const CustomAppBar(
      {super.key,
      this.elevation = 0,
      this.back,
      this.title,
      this.actions,
      this.arrowColor,
      this.backgroundColor,
      this.shadowColor});
  final double elevation;
  final VoidCallback? back;
  final String? title;
  final Color? arrowColor;
  final Color? backgroundColor;
  final Color? shadowColor;
  final List<Widget>? actions;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: backgroundColor ?? Palette.white,
        borderRadius: BorderRadius.only(bottomLeft: Radius.circular(20.r),bottomRight: Radius.circular(20.r)),
        boxShadow: [
          BoxShadow(
            color: shadowColor ?? Palette.appBarShadow,
            blurRadius: 15.r,
            offset: const Offset(0, 4),
            spreadRadius: 0,
          )
        ],
      ),
      child: AppBar(
        elevation: elevation,
        leading: GestureDetector(
          onTap: back ?? () => navigatorService.back(),
          child: Icon(
            Icons.arrow_back_rounded,
            color: arrowColor ?? Palette.black,
          ),
        ),
        title: title != null
            ? Text(
                title!,
                style: TextStyle(
                  color: Palette.black,
                  fontSize: 16.sp,
                  fontWeight: FontWeight.w600,
                ),
              )
            : null,
        centerTitle: true,
        actions: actions,
      ),
    );
  }

  @override
  Size get preferredSize => AppBar().preferredSize;
}
