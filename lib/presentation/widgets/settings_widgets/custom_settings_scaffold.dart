import 'package:alif/utils/style/colors.dart';
import 'package:flutter/material.dart';

class CustomSettingScaffold extends StatelessWidget {
  const CustomSettingScaffold({
    super.key,
    required this.title,
    required this.child,
  });

  final String title;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    final paddingTop = MediaQuery.of(context).viewPadding.top;
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: AppColors.secondary,
      appBar: AppBar(
        iconTheme: IconThemeData(color: AppColors.surface),
        flexibleSpace: Container(
          width: double.infinity,
          height: double.infinity,
          padding: EdgeInsetsDirectional.only(top: paddingTop),
          alignment: AlignmentDirectional.center,
          decoration: BoxDecoration(
            gradient: const LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: [
                AppColors.onPrimary,
                AppColors.primary,
              ],
            ),
          ),
          child: Text(
            title,
            style: Theme.of(context).textTheme.headlineSmall!.copyWith(
                  color: AppColors.surface,
                  fontWeight: FontWeight.w600,
                ),
          ),
        ),
      ),
      body: SafeArea(
        left: false,
        right: false,
        child: child,
      ),
    );
  }
}
