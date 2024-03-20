import 'package:flutter/material.dart';
import 'package:stage_up/config/theme/theme.dart';

class PrimaryButton extends StatelessWidget {
  const PrimaryButton({
    super.key,
    required this.onPressed,
    required this.child,
    this.color,
    this.elevation,
    this.radius,
    this.width,
    this.height,
    this.hPadding,
    this.vPadding,
    this.borderColor,
    this.borderWidth,
  });

  final VoidCallback onPressed;
  final Widget child;
  final Color? color, borderColor;
  final double? elevation,
      radius,
      width,
      height,
      hPadding,
      vPadding,
      borderWidth;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPressed,
      child: Material(
        elevation: elevation ?? 5,
        borderRadius: BorderRadius.circular(radius ?? 10),
        color: color ?? AppTheme.primary,
        child: Container(
          width: width,
          height: height,
          padding: EdgeInsets.symmetric(
              horizontal: hPadding ?? 5, vertical: vPadding ?? 5),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(radius ?? 10),
            color: color ?? AppTheme.primary,
            border: Border.all(
                color: borderColor ?? Colors.transparent,
                width: borderWidth ?? 0),
          ),
          child: child,
        ),
      ),
    );
  }
}
