import 'package:alif/presentation/widgets/custom_appbar.dart';
import 'package:alif/utils/style/colors.dart';
import 'package:flutter/material.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    // final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;
    return Scaffold(
      extendBodyBehindAppBar: true,
      backgroundColor: AppColors.secondary,
      appBar: CustomeAppBar(
        height: height,
        currentUser: null,
        child: SizedBox.shrink(),
      ),
      body: const Placeholder(),
    );
  }
}
