import 'package:alif/utils/style/alif_icons.dart';
import 'package:alif/utils/style/colors.dart';
import 'package:flutter/material.dart';

class CustomSavedButton extends StatelessWidget {
  const CustomSavedButton({super.key});

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    return Container(
      width: height * 0.040,
      height: height * 0.040,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: AppColors.surface.withOpacity(0.85),
      ),
      child: IconButton(
        onPressed: () {},
        icon: Icon(
          AlifIcons.saved_outlined,
          size: 25,
          color: AppColors.onPrimary,
        ),
      ),
    );
  }
}
