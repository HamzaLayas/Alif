import 'package:alif/utils/style/colors.dart';
import 'package:flutter/material.dart';

void showSnackBar(
  String? error,
  BuildContext context, [
  Color textColor = AppColors.onSecondary,
  Color backGroundColor = AppColors.onPrimary,
]) {
  ScaffoldMessenger.of(context).clearSnackBars();
  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      backgroundColor: backGroundColor,
      content: Text(
        error ?? 'Authentication failed.',
        style: Theme.of(context).textTheme.bodyMedium!.copyWith(
              color: textColor,
              fontWeight: FontWeight.bold,
            ),
      ),
    ),
  );
}
