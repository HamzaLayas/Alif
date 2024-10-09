import 'package:flutter/material.dart';

class CustomSettingsCard extends StatelessWidget {
  const CustomSettingsCard({super.key, required this.children});
  final List<Widget> children;

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    return Card(
      elevation: 2,
      child: Padding(
        padding: EdgeInsetsDirectional.all(width * 0.025),
        child: Column(
          mainAxisSize: MainAxisSize.max,
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.center,
          children: children,
        ),
      ),
    );
  }
}
