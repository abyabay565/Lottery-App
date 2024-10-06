import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';


import '../app/ui_helpers.dart';
import '../theme/app_color.dart';

class RadioItemsView extends StatelessWidget {
  const RadioItemsView(
      {super.key,
        required this.isChecked,
        required this.label,
        required this.iconSelected,
        required this.iconUnSelected,
        required this.onChanged,
        this.additionalStart,
        this.additionalEnd,
        this.iconHeight,
        this.iconWidth,
        this.labelSize,
        this.labelColor, this.labelWeight});

  final bool isChecked;
  final String label;
  final Widget? additionalStart;
  final Widget? additionalEnd;
  final double? labelSize;
  final Color? labelColor;
  final FontWeight? labelWeight;
  final double? iconHeight;
  final double? iconWidth;
  final String iconSelected;
  final String iconUnSelected;
  final VoidCallback onChanged;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onChanged,
      child: Row(
        children: [
          SvgPicture.asset(
            isChecked ? iconSelected : iconUnSelected,
            width: iconWidth ?? 18,
            height: iconHeight ?? 18,
            fit: BoxFit.cover,
          ),
          width_15,
          if (additionalStart != null) additionalStart!,
          Expanded(
            child: Text(
              label,
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
              style: TextStyle(
                  color: labelColor??Palette.normalTextColor,
                  fontSize: labelSize??14.sp,
                  fontWeight: labelWeight??FontWeight.w400),
            ),
          ),
          if (additionalEnd != null) additionalEnd!,
        ],
      ),
    );
  }
}