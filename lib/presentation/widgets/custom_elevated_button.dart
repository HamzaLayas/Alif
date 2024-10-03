import 'package:alif/utils/style/colors.dart';
import 'package:flutter/material.dart';

class CustomElevatedButton extends StatelessWidget {
  const CustomElevatedButton({
    super.key,
    required this.text,
    required this.onTap,
  });
  final String text;
  final void Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      focusColor: AppColors.secondary,
      splashColor: AppColors.secondary,
      highlightColor: AppColors.secondary,
      borderRadius: BorderRadius.circular(16),
      onTap: onTap,
      child: AspectRatio(
        aspectRatio: 335 / 58,
        child: Container(
          decoration: BoxDecoration(
            gradient: const LinearGradient(
              begin: AlignmentDirectional.topEnd,
              end: AlignmentDirectional.bottomStart,
              colors: [
                AppColors.onPrimary,
                AppColors.primary,
              ],
            ),
            borderRadius: BorderRadius.circular(16),
          ),
          child: Center(
            child: Text(
              text,
              style: Theme.of(context).textTheme.headlineSmall!.copyWith(
                  color: AppColors.onSecondary, fontWeight: FontWeight.w600),
            ),
          ),
        ),
      ),
    );
  }
}
