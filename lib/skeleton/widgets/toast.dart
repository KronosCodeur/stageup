import 'package:awesome_snackbar_content/awesome_snackbar_content.dart';
import 'package:flutter/material.dart';
import 'package:stageup/config/theme/theme.dart';

void toast(
    {required BuildContext context,
    required String title,
    required String message,
    bool success = true}) {
  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      elevation: 0,
      backgroundColor: Colors.transparent,
      content: AwesomeSnackbarContent(
        title: title,
        message: message,
        color: success ? AppTheme.primary : AppTheme.error,
        contentType: success ? ContentType.success : ContentType.failure,
      ),
    ),
  );
}
