import 'package:flutter/material.dart';
import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../theme/app_color.dart';

class CustomDropdown<T> extends StatelessWidget {
  final String hint;
  final void Function(T?) onChanged;
  final DropdownButtonBuilder? selectedItemBuilder;
  final Alignment? hintAlignment;
  final Alignment? valueAlignment;
  final double? buttonHeight, buttonWidth;
  final EdgeInsetsGeometry? contentPadding;
  final EdgeInsetsGeometry? buttonPadding;
  final bool showInputDecoration;
  final bool showButtonDecoration;
  final BoxDecoration? buttonDecoration;
  final int? buttonElevation;
  final Widget? icon;
  final Color? fillColor;
  final double? iconSize;
  final Color? iconEnabledColor;
  final Color? iconDisabledColor;
  final Color? borderSideColor;
  final double? itemHeight;
  final EdgeInsetsGeometry? itemPadding;
  final double? dropdownHeight, dropdownWidth;
  final EdgeInsetsGeometry? dropdownPadding;
  final BoxDecoration? dropdownDecoration;
  final int? dropdownElevation;
  final double outerBorderRadius;
  final double dropdownRadius;
  final Radius? scrollbarRadius;
  final double? scrollbarThickness;
  final bool? scrollbarAlwaysShow;
  final double menuItemHeight;
  final EdgeInsetsGeometry menuItemPadding;
  final Offset offset;
  final String? Function(T?)? validator;
  final void Function(T?)? onSaved;
  final String Function(T) itemAsString;
  final List<T> items;
  final T? value;
  final Color hintTextColor;
  final Color itemTextColor;
  final String? label;
  final String? labelTitle;
  final double fontSize;
  final bool mandatory;
  final TextStyle? labelTextStyle;

  const CustomDropdown({
    this.label,
    this.fontSize = 16,
    this.mandatory = false,
    required this.hint,
    required this.onChanged,
    required this.itemAsString,
    required this.items,
    this.showInputDecoration = true,
    this.showButtonDecoration = false,
    this.selectedItemBuilder,
    this.hintAlignment,
    this.valueAlignment,
    this.buttonHeight,
    this.buttonWidth,
    this.contentPadding,
    this.buttonPadding,
    this.buttonDecoration,
    this.buttonElevation,
    this.outerBorderRadius = 5,
    this.fillColor = Palette.white,
    this.icon,
    this.iconSize,
    this.iconEnabledColor,
    this.iconDisabledColor,
    this.borderSideColor,
    this.itemHeight,
    this.itemPadding,
    this.dropdownHeight,
    this.dropdownWidth,
    this.dropdownPadding,
    this.dropdownDecoration,
    this.dropdownElevation,
    this.dropdownRadius = 30,
    this.scrollbarRadius,
    this.scrollbarThickness,
    this.scrollbarAlwaysShow,
    this.offset = Offset.zero,
    this.menuItemHeight = 40,
    this.menuItemPadding = const EdgeInsets.only(left: 10, right: 10),
    this.validator,
    this.onSaved,
    this.value,
    this.hintTextColor = Palette.grayText,
    this.itemTextColor = Palette.black,
    Key? key,
    this.labelTextStyle,
    this.labelTitle,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    InputBorder border = OutlineInputBorder(
      borderSide: const BorderSide(
        color: Palette.grayLight,
      ),
      borderRadius: BorderRadius.circular(6.r),
    );
    InputBorder focusedBorder = OutlineInputBorder(
      borderSide: const BorderSide(
        color: Palette.primary,
      ),
      borderRadius: BorderRadius.circular(6.r),
    );

    TextSpan buildLabelText() {
      return TextSpan(
        text: "",
        style: TextStyle(
          fontSize: fontSize.sp,
          fontWeight: FontWeight.w400,
          color: Palette.grayText,
        ),
        children: mandatory
            ? [
                const TextSpan(
                  text: '',
                  style: TextStyle(
                    color: Palette.red,
                  ),
                ),
              ]
            : [],
      );
    }

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        label == null
            ? const SizedBox()
            : Padding(
                padding: EdgeInsets.only(bottom: 6.h),
                child: Text(
                  label ?? "",
                  style: labelTextStyle ??
                      TextStyle(
                          color: Palette.normalTextColor,
                          fontSize: 14.sp,
                          fontWeight: FontWeight.w400),
                ),
              ),
        DropdownButtonHideUnderline(
          child: DropdownButtonFormField2<T>(
            validator: validator,
            onSaved: onSaved,
            onChanged: onChanged,
            value: value,
            //To avoid long text overflowing.
            isExpanded: true,
            isDense: true,

            hint: Container(
              alignment: hintAlignment ?? Alignment.centerLeft,
              child: Text(
                hint,
                overflow: TextOverflow.ellipsis,
                maxLines: 1,
                style: TextStyle(
                  fontSize: 13.sp,
                  fontWeight: FontWeight.w400,
                  color: hintTextColor,
                ),
              ),
            ),
            items: items
                .map(
                  (item) => DropdownMenuItem<T>(
                    value: item,
                    child: Container(
                      width: double.infinity,
                      alignment: valueAlignment ?? Alignment.centerLeft,
                      child: Text(
                        itemAsString(item),
                        overflow: TextOverflow.ellipsis,
                        maxLines: 1,
                        style: TextStyle(
                          fontSize: 13.sp,
                          fontWeight: FontWeight.w400,
                          color: itemTextColor,
                        ),
                      ),
                    ),
                  ),
                )
                .toList(),
            decoration: showInputDecoration
                ? InputDecoration(
                    // Add Horizontal padding using menuItemStyleData.padding so it matches
                    // the menu padding when button's width is not specified.
                    label: Text.rich(buildLabelText()),
                    contentPadding: const EdgeInsets.only(
                      left: 20,
                      right: 16,
                    ), //EdgeInsets.zero,
                    fillColor: fillColor,
                    filled: true,
                    border: border,
                    enabledBorder: border,
                    disabledBorder: border,
                    focusedBorder: focusedBorder,
                    // Add more decoration..
                  )
                : const InputDecoration(
                    border: InputBorder.none, // Hide the underline
                  ),
            buttonStyleData: ButtonStyleData(
              height: buttonHeight ?? 45.h,
              width: buttonWidth ?? 160.w,

              decoration: showButtonDecoration
                  ? BoxDecoration(
                      borderRadius: BorderRadius.circular(outerBorderRadius),
                      border: Border.all(
                        color: borderSideColor ?? Colors.white,
                      ),
                      color: fillColor,
                    )
                  : null,
              //buttonElevation: buttonElevation,
            ),
            iconStyleData: IconStyleData(
              icon: icon ?? const Icon(Icons.keyboard_arrow_down_outlined),
              iconSize: iconSize ?? 20,
              iconEnabledColor: Palette.grayLightEnabled,
              iconDisabledColor: Palette.grayLight,
            ),
            dropdownStyleData: DropdownStyleData(
              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
              maxHeight: dropdownHeight ?? 250,
              width: dropdownWidth,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8.r),
                color: const Color(0xFFF9F9F9),
              ),
              offset: offset,
              scrollbarTheme: ScrollbarThemeData(
                radius: scrollbarRadius ?? const Radius.circular(40),
                thickness: scrollbarThickness != null
                    ? WidgetStateProperty.all<double>(scrollbarThickness!)
                    : null,
                thumbVisibility: scrollbarAlwaysShow != null
                    ? WidgetStateProperty.all<bool>(scrollbarAlwaysShow!)
                    : null,
              ),
              elevation: dropdownElevation ?? 1,
            ),
            menuItemStyleData: MenuItemStyleData(
              height: menuItemHeight,
              padding: menuItemPadding,
            ),
          ),
        ),
      ],
    );
  }
}
