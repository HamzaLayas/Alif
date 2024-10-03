import 'package:alif/presentation/home/pages/explore_page_view.dart';
import 'package:alif/presentation/home/pages/home_page_view.dart';
import 'package:alif/presentation/home/pages/profile_page_view.dart';
import 'package:alif/presentation/home/pages/saved_page_view.dart';
import 'package:alif/presentation/home/pages/tickets_page_view.dart';
import 'package:alif/presentation/widgets/custom_gradient_shader.dart';
import 'package:alif/utils/style/colors.dart';
import 'package:flutter/material.dart';

class MainScreen extends StatelessWidget {
  const MainScreen({super.key});
  static final PageController pageController = PageController(initialPage: 2);

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;
    int selectedPage = 2;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.transparent,
        actions: [
          IconButton(
              onPressed: () {},
              icon: Icon(
                size: width * 0.075,
                Icons.notifications_none_outlined,
                color: AppColors.onSecondary,
              ))
        ],
        flexibleSpace: Container(
          height: height * 0.25,
        ),
      ),
      body: PageView(
        controller: pageController,
        children: [
          ExplorePageView(),
          TicketsPageView(),
          HomePageView(),
          SavedPageView(),
          ProfilePageView(),
        ],
      ),
      bottomSheet: CustomBottomSheet(selectedPage: selectedPage),
    );
  }
}

class CustomBottomSheet extends StatelessWidget {
  const CustomBottomSheet({
    super.key,
    required this.selectedPage,
  });

  final int selectedPage;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color: AppColors.surface,
          borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(24),
            topRight: Radius.circular(24),
          ),
          boxShadow: [
            BoxShadow(
              color: AppColors.secondary.withOpacity(0.08),
              offset: const Offset(0, 2),
              blurRadius: 5,
              spreadRadius: 5,
            )
          ]),
      child: ClipRRect(
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(24),
          topRight: Radius.circular(24),
        ),
        child: BottomNavigationBar(
          iconSize: 35,
          elevation: 0,
          enableFeedback: true,
          showUnselectedLabels: true,
          backgroundColor: AppColors.transparent,
          selectedItemColor: AppColors.secondary,
          unselectedItemColor: AppColors.secondary.withOpacity(0.6),
          selectedLabelStyle: Theme.of(context)
              .textTheme
              .bodyLarge!
              .copyWith(fontWeight: FontWeight.w900),
          unselectedLabelStyle: Theme.of(context)
              .textTheme
              .bodyLarge!
              .copyWith(fontWeight: FontWeight.w600),
          currentIndex: selectedPage,
          items: const [
            BottomNavigationBarItem(
              label: "Explore",
              backgroundColor: AppColors.transparent,
              activeIcon: CustomGradientShader(
                child: Icon(Icons.explore),
              ),
              icon: CustomGradientShader(
                child: Icon(Icons.explore_outlined),
              ),
            ),
            BottomNavigationBarItem(
              label: "Tickets",
              backgroundColor: AppColors.transparent,
              activeIcon: CustomGradientShader(
                child: Icon(Icons.airplane_ticket),
              ),
              icon: CustomGradientShader(
                child: Icon(Icons.airplane_ticket_outlined),
              ),
            ),
            BottomNavigationBarItem(
              label: "Home",
              backgroundColor: AppColors.transparent,
              activeIcon: CustomGradientShader(
                child: Icon(Icons.home_rounded),
              ),
              icon: CustomGradientShader(
                child: Icon(Icons.home_outlined),
              ),
            ),
            BottomNavigationBarItem(
              label: "Saved",
              backgroundColor: AppColors.transparent,
              activeIcon: CustomGradientShader(
                child: Icon(Icons.favorite_rounded),
              ),
              icon: CustomGradientShader(
                child: Icon(Icons.favorite_outline_rounded),
              ),
            ),
            BottomNavigationBarItem(
              label: "Profile",
              backgroundColor: AppColors.transparent,
              activeIcon: CustomGradientShader(
                child: Icon(Icons.person_2_rounded),
              ),
              icon: CustomGradientShader(
                child: Icon(Icons.person_2_outlined),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
