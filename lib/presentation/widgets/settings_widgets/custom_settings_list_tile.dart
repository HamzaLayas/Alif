import 'package:alif/presentation/widgets/custom_gradient_shader.dart';
import 'package:alif/utils/style/alif_icons.dart';
import 'package:flutter/material.dart';

class CustomSettingsListTile extends StatelessWidget {
  const CustomSettingsListTile({
    super.key,
    required this.title,
    required this.icon,
    required this.onTap,
  });
  final IconData icon;
  final String title;
  final void Function()? onTap;

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    return ListTile(
      onTap: onTap,
      minTileHeight: height * 0.045,
      contentPadding: EdgeInsets.zero,
      leading: CustomGradientShader(
        child: Icon(icon, size: 30),
      ),
      title: Text(
        title,
        style: Theme.of(context).textTheme.titleLarge,
      ),
      trailing: CustomGradientShader(
        child: Icon(AlifIcons.left_open_big, size: 25),
      ),
    );
  }
}
