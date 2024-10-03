import 'package:alif/utils/style/colors.dart';
import 'package:flutter/material.dart';

class CustomGradientShader extends StatelessWidget {
  const CustomGradientShader({
    super.key,
    required this.child,
  });
  final Widget? child;
  @override
  Widget build(BuildContext context) {
    return ShaderMask(
      blendMode: BlendMode.modulate,
      shaderCallback: (bounds) => const LinearGradient(
        begin: Alignment.topLeft,
        end: Alignment.bottomRight,
        colors: [
          AppColors.onPrimary,
          AppColors.primary,
        ],
      ).createShader(bounds),
      child: ColorFiltered(
        colorFilter:
            const ColorFilter.mode(AppColors.onSecondary, BlendMode.srcATop),
        child: child,
      ),
    );
  }
}
