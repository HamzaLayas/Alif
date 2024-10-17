import 'package:alif/utils/style/colors.dart';
import 'package:flutter/material.dart';

class CustomScaffold extends StatelessWidget {
  const CustomScaffold({
    super.key,
    required this.title,
    required this.child,
    this.bottom,
    this.paddingBottom,
    this.appBarBottomRadius,
  });

  final String title;
  final Widget child;
  final PreferredSizeWidget? bottom;
  final double? paddingBottom;
  final double? appBarBottomRadius;

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
          padding: EdgeInsetsDirectional.only(
            top: paddingTop,
            bottom: paddingBottom ?? 0,
          ),
          alignment: AlignmentDirectional.center,
          decoration: BoxDecoration(
            borderRadius: BorderRadiusDirectional.only(
              bottomStart: Radius.circular(appBarBottomRadius ?? 0),
              bottomEnd: Radius.circular(appBarBottomRadius ?? 0),
            ),
            gradient: const LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: [
                AppColors.onPrimary,
                AppColors.primary,
              ],
            ),
            boxShadow: [
              BoxShadow(
                color: AppColors.onSurface.withOpacity(0.2),
                offset: const Offset(0, -3.5),
                blurRadius: 10,
                spreadRadius: 5,
              )
            ],
          ),
          child: Text(
            title,
            style: Theme.of(context).textTheme.headlineSmall!.copyWith(
                  color: AppColors.surface,
                  fontWeight: FontWeight.w600,
                ),
          ),
        ),
        bottom: bottom,
      ),
      body: SafeArea(
        left: false,
        right: false,
        child: child,
      ),
    );
  }
}
