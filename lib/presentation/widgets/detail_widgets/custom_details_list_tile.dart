import 'dart:ui';

import 'package:alif/presentation/widgets/custom_gradient_shader.dart';
import 'package:alif/utils/style/colors.dart';
import 'package:flutter/material.dart';

class CustomDetailsListTile extends StatelessWidget {
  const CustomDetailsListTile({
    super.key,
    required this.icon,
    required this.title,
    required this.subTitle,
  });

  final IconData icon;
  final String title;
  final String subTitle;

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    return ListTile(
      dense: true,
      minTileHeight: 0,
      minVerticalPadding: 0,
      contentPadding: EdgeInsets.zero,
      visualDensity: VisualDensity.compact,
      leading: Container(
        width: width * 0.1,
        height: width * 0.1,
        decoration: BoxDecoration(
          color: AppColors.accentBlue.withOpacity(0.5),
          borderRadius: BorderRadius.circular(12),
        ),
        child: CustomGradientShader(
          child: Icon(icon, size: 25),
        ),
      ),
      title: Text(
        title,
        style: Theme.of(context)
            .textTheme
            .titleMedium!
            .copyWith(fontWeight: FontWeight.w500),
      ),
      subtitle: Text(
        subTitle,
        style: Theme.of(context)
            .textTheme
            .titleMedium!
            .copyWith(fontWeight: FontWeight.w600),
      ),
    );
  }
}
