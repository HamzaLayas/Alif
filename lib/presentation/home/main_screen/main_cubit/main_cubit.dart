import 'package:alif/presentation/home/pages/home_page/home_page.dart';
import 'package:alif/presentation/home/pages/explore_page/explore_page.dart';
import 'package:alif/presentation/home/pages/profile_page/profile_page.dart';
import 'package:alif/presentation/home/pages/saved_page/saved_page.dart';
import 'package:alif/presentation/home/pages/tickets_page/tickets_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
part 'main_state.dart';

class MainCubit extends Cubit<MainState> {
  MainCubit() : super(MainInitial());

  int selectedPage = 2;

  final PageController pageController = PageController(initialPage: 2);

  final List<Widget> pages = [
    ExplorePage(),
    TicketsPage(),
    HomePage(),
    SavedPage(),
    ProfilePage(),
  ];

  changePageTo({required int page}) {
    if (selectedPage != page) {
      selectedPage = page;
      pageController.jumpToPage(page);
      switch (page) {
        case 0:
          emit(ExplorePageState());
        case 1:
          emit(TicketsPageState());
        case 2:
          emit(HomePageState());
        case 3:
          emit(SavedPageState());
        case 4:
          emit(ProfilePageState());
      }
    }
  }
}
