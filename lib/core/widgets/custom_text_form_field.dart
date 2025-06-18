import 'package:alefk/core/constants/padding.dart';
import 'package:alefk/core/themes/app_colors.dart';
import 'package:flutter/material.dart';

class CustomTextFormField extends StatelessWidget {
  final TextEditingController? controller;
  final String? initialValue;
  final String? hintText;
  final String? labelText;
  final Widget? prefixIcon;
  final Widget? suffixIcon;
  final bool obscureText;
  final TextInputType keyboardType;
  final TextInputAction? textInputAction;
  final String? Function(String?)? validator;
  final void Function(String)? onChanged;
  final void Function(String)? onFieldSubmitted;
  final void Function()? onTap;
  final FocusNode? focusNode;
  final int? maxLines;
  final int? minLines;
  final bool readOnly;
  final bool enabled;
  final EdgeInsetsGeometry? contentPadding;
  final InputBorder? border;
  final InputBorder? focusedBorder;
  final InputBorder? enabledBorder;
  final InputBorder? errorBorder;
  final bool? fillColor;
  final Color? fillColorValue;
  final Decoration? decoration;
  final bool? boldHint;
  const CustomTextFormField({
    super.key,
    this.controller,
    this.initialValue,
    this.hintText,
    this.labelText,
    this.prefixIcon,
    this.suffixIcon,
    this.obscureText = false,
    this.keyboardType = TextInputType.text,
    this.textInputAction,
    this.validator,
    this.onChanged,
    this.onFieldSubmitted,
    this.onTap,
    this.focusNode,
    this.maxLines = 1,
    this.minLines,
    this.readOnly = false,
    this.enabled = true,
    this.contentPadding,
    this.border,
    this.focusedBorder,
    this.enabledBorder,
    this.errorBorder,
    this.fillColor,
    this.fillColorValue,
    this.decoration,
    this.boldHint,
  });

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    final textStyle = TextStyle(
      fontWeight: FontWeight.bold,
      color: isDark ? AppColors.current.darkText : AppColors.current.text,
    );

    return Padding(
      padding: PaddingConstants.horizontalMedium,
      child: TextFormField(
        controller: controller,
        initialValue: initialValue,
        obscureText: obscureText,
        keyboardType: keyboardType,
        textInputAction: textInputAction,
        validator: validator,
        onChanged: onChanged,
        onFieldSubmitted: onFieldSubmitted,
        onTap: onTap,
        focusNode: focusNode,
        maxLines: maxLines,
        minLines: minLines,
        readOnly: readOnly,
        enabled: enabled,
        decoration: InputDecoration(
          hintText: hintText,
          hintStyle: boldHint ?? true ? textStyle : const TextStyle(),
          labelText: labelText,
          filled: fillColor,
          fillColor: fillColorValue,
          prefixIcon: prefixIcon,
          suffixIcon: suffixIcon,
          contentPadding: contentPadding ??
              const EdgeInsets.symmetric(vertical: 15.0, horizontal: 10.0),
          border: border ?? const OutlineInputBorder(),
          focusedBorder: focusedBorder ??
              OutlineInputBorder(
                  borderRadius: const BorderRadius.all(Radius.circular(12.0)),
                  borderSide: BorderSide(
                    color: AppColors.current.blue,
                  )),
          enabledBorder: enabledBorder ??
              OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(12.0)),
                  borderSide: BorderSide(color: AppColors.current.white)),
          errorBorder: enabledBorder ??
              OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(12.0)),
                borderSide: BorderSide(
                  color: AppColors.current.red,
                ),
              ),
        ),
      ),
    );
  }
}
