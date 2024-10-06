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
    return AspectRatio(
      aspectRatio: 335 / 55,
      child: InkWell(
        splashColor: AppColors.onSecondary,
        borderRadius: BorderRadius.circular(16),
        onTap: onTap,
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
              style: Theme.of(context).textTheme.headlineMedium!.copyWith(
                  color: AppColors.surface, fontWeight: FontWeight.w600),
            ),
          ),
        ),
      ),
    );
  }
}
