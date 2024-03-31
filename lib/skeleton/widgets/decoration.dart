import 'package:flutter/material.dart';
import 'package:stageup/config/theme/theme.dart';

class AppWidgetDecoration {
  static InputDecoration inputDecoration({
    required String hint,
    IconData? icon,
    Widget? suffixIcon,
    String? label,
    Color? borderColor,
    TextStyle? hintStyle,
    double? borderWidth,
  }) =>
      const InputDecoration().copyWith(
        hintText: hint,
        hintStyle:
            hintStyle ?? const TextStyle(color: AppTheme.gray, fontSize: 15),
        border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: BorderSide(
              width: 1,
              color: borderColor ?? AppTheme.primary,
            )),
        enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: BorderSide(
              width: borderWidth ?? 1,
              color: borderColor ?? AppTheme.primary,
            )),
        focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: BorderSide(
              width: borderWidth ?? 1,
              color: borderColor ?? AppTheme.primary,
            )),
        errorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: BorderSide(
              width: borderWidth ?? 1,
              color: borderColor ?? AppTheme.primary,
            )),
        enabled: true,
        contentPadding: const EdgeInsets.symmetric(horizontal: 10),
        suffixIcon: suffixIcon,
        label: (label == null && icon == null)
            ? null
            : Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Icon(
                    icon,
                    color: AppTheme.primary,
                    size: 20,
                  ),
                  Text(
                    label ?? "",
                    style: TextStyle(
                        color: AppTheme.primary,
                        fontSize: 12,
                        fontWeight: FontWeight.w600),
                  ),
                ],
              ),
      );
}
