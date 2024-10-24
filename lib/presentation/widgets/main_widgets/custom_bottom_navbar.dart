import 'package:alif/presentation/widgets/custom_gradient_shader.dart';
import 'package:alif/utils/style/alif_icons.dart';
import 'package:alif/utils/style/colors.dart';
import 'package:flutter/material.dart';

class CustomBotNavBar extends StatelessWidget {
  const CustomBotNavBar({
    super.key,
    required this.onTap,
    required this.selectedPage,
  });
  final void Function(int)? onTap;
  final int selectedPage;

  @override
  Widget build(BuildContext context) {
    // final width = MediaQuery.of(context).size.width;
    // final height = MediaQuery.of(context).size.height;
    return Container(
      // height: height * 0.0775,
      decoration: BoxDecoration(
        color: AppColors.secondary,
        borderRadius: const BorderRadiusDirectional.only(
          topStart: Radius.circular(38),
          topEnd: Radius.circular(38),
        ),
        boxShadow: [
          BoxShadow(
            color: AppColors.onSurface.withOpacity(0.08),
            offset: const Offset(0, 3.5),
            blurRadius: 10,
            spreadRadius: 5,
          )
        ],
      ),
      child: ClipRRect(
        borderRadius: const BorderRadiusDirectional.only(
          topStart: Radius.circular(38),
          topEnd: Radius.circular(38),
        ),
        child: BottomNavigationBar(
          iconSize: 35,
          elevation: 0,
          enableFeedback: true,
          showUnselectedLabels: true,
          type: BottomNavigationBarType.fixed,
          backgroundColor: AppColors.transparent,
          selectedItemColor: AppColors.onSurface,
          unselectedItemColor: AppColors.onSurface.withOpacity(0.6),
          selectedLabelStyle: Theme.of(context)
              .textTheme
              .bodyLarge!
              .copyWith(fontWeight: FontWeight.w700),
          unselectedLabelStyle: Theme.of(context)
              .textTheme
              .bodyLarge!
              .copyWith(fontWeight: FontWeight.w600),
          currentIndex: selectedPage,
          items: const [
            BottomNavigationBarItem(
              label: "الرئيسية",
              backgroundColor: AppColors.transparent,
              activeIcon: CustomGradientShader(
                child: Icon(AlifIcons.home),
              ),
              icon: CustomGradientShader(
                child: Icon(AlifIcons.home_outlined),
              ),
            ),
            BottomNavigationBarItem(
              label: "الحجوزات",
              backgroundColor: AppColors.transparent,
              activeIcon: CustomGradientShader(
                child: Icon(AlifIcons.ticket),
              ),
              icon: CustomGradientShader(
                child: Icon(AlifIcons.ticket_outlined),
              ),
            ),
            BottomNavigationBarItem(
              label: "إستكشف",
              backgroundColor: AppColors.transparent,
              activeIcon: CustomGradientShader(
                child: Icon(Icons.explore),
              ),
              icon: CustomGradientShader(
                child: Icon(Icons.explore_outlined),
              ),
            ),
            BottomNavigationBarItem(
              label: "المحفوظات",
              backgroundColor: AppColors.transparent,
              activeIcon: CustomGradientShader(
                child: Icon(AlifIcons.saved),
              ),
              icon: CustomGradientShader(
                child: Icon(AlifIcons.saved_outlined),
              ),
            ),
            BottomNavigationBarItem(
              label: "الحساب",
              backgroundColor: AppColors.transparent,
              activeIcon: CustomGradientShader(
                child: Icon(AlifIcons.user),
              ),
              icon: CustomGradientShader(
                child: Icon(AlifIcons.user_outlined),
              ),
            ),
          ],
          onTap: onTap,
        ),
      ),
    );
  }
}
