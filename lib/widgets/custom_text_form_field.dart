import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../theme/app_color.dart';

class CustomTextFormField extends StatelessWidget {
  const CustomTextFormField(
      {super.key,
      this.mainPadding,
      this.label,
      this.hintText,
      this.data,
      this.labelTextStyle,
      this.contentPadding,
      this.mandatory = false,
      this.error = false,
      this.customBorder,
      this.enabledBorder,
      this.disableBorder,
      this.prefixIcon,
      this.prefix,
      this.suffixIconPadding,
      this.suffixIcon,
      this.controller,
      this.readOnly = false,
      this.keyboardType = TextInputType.text,
      this.textCapitalization = TextCapitalization.none,
      this.maxLines,
      this.maxLength,
      this.inputFormatters,
      this.validator,
      this.onChanged,
      this.onFieldSubmitted,
      this.onSaved,
      this.onTap,
      this.initialValue,
      this.isDense = false});

  final EdgeInsetsGeometry? mainPadding;
  final EdgeInsets? contentPadding;
  final String? label;
  final String? hintText;
  final String? data;
  final TextStyle? labelTextStyle;
  final bool mandatory;
  final bool error;
  final InputBorder? customBorder;
  final InputBorder? enabledBorder;
  final InputBorder? disableBorder;

  final Widget? prefixIcon;
  final Widget? prefix;
  final EdgeInsetsGeometry? suffixIconPadding;
  final Widget? suffixIcon;
  final TextEditingController? controller;
  final bool readOnly;
  final TextInputType keyboardType;
  final TextCapitalization textCapitalization;
  final int? maxLines;
  final int? maxLength;
  final List<TextInputFormatter>? inputFormatters;
  final String? Function(String? value)? validator;
  final void Function(String value)? onChanged;
  final void Function(String value)? onFieldSubmitted;
  final void Function(String? value)? onSaved;
  final void Function()? onTap;
  final String? initialValue;
  final bool isDense;

  @override
  Widget build(BuildContext context) {
    InputBorder border = OutlineInputBorder(
      borderSide: BorderSide(
        color: error ? Palette.red : Palette.borderGrayColor,
      ),
      borderRadius: BorderRadius.circular(6.r),
    );
    InputBorder focusedBorder = OutlineInputBorder(
      borderSide: BorderSide(
        color: error ? Palette.red : Palette.black,
      ),
      borderRadius: BorderRadius.circular(6.r),
    );
    TextSpan buildLabelText() {
      return TextSpan(
        text: "",
        style: labelTextStyle ??
            TextStyle(
                color: Palette.normalTextColor,
                fontSize: 14.sp,
                fontWeight: FontWeight.w400),
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

    return Container(
      padding: mainPadding ?? EdgeInsets.zero,
      child: Column(
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
          TextFormField(
            decoration: InputDecoration(
              fillColor: Palette.white,
              alignLabelWithHint: false,
              filled: true,
              errorMaxLines: 2,
              label: Text.rich(buildLabelText()),
              labelStyle: TextStyle(
                fontSize: 14.sp,
                fontWeight: FontWeight.w400,
                color: Palette.black,
              ),
              counterText: "",
              contentPadding: contentPadding,
              floatingLabelBehavior: FloatingLabelBehavior.always,
              isDense: true,
              border: customBorder ?? border,
              enabledBorder: enabledBorder ?? border,
              disabledBorder: disableBorder ?? border,
              focusedBorder: focusedBorder,
              hintText: hintText,
              hintStyle: TextStyle(
                fontSize: 13.sp,
                color: Palette.grayText,
                fontWeight: FontWeight.w400,
              ),
              prefixIcon: prefixIcon,
              prefix: prefix,
              prefixIconConstraints: const BoxConstraints(),
              suffixIcon: Padding(
                padding: suffixIconPadding ?? EdgeInsets.zero,
                child: suffixIcon,
              ),
              suffixIconConstraints: const BoxConstraints(),
            ),
            style: TextStyle(
              color: Palette.black,
              fontSize: 14.sp,
              fontWeight: FontWeight.w400,
            ),
            maxLines: maxLines,
            maxLength: maxLength,
            readOnly: readOnly,
            keyboardType: keyboardType,
            textCapitalization: textCapitalization,
            inputFormatters: inputFormatters,
            validator: validator,
            onChanged: onChanged,
            onFieldSubmitted: onFieldSubmitted,
            onSaved: onSaved,
            onTap: onTap,
            initialValue: initialValue,
            controller: controller,
          )
        ],
      ),
    );
  }
}
