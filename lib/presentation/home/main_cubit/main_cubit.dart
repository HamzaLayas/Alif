import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
part 'main_state.dart';

class MainCubit extends Cubit<MainState> {
  MainCubit() : super(MainInitial());

  int selectedPage = 2;

  final PageController pageController = PageController(initialPage: 2);

  updateNavBar({required int page}) {
    selectedPage = page;
    switch (page) {
      case 0:
        emit(ExplorePage());
      case 1:
        emit(TicketsPage());
      case 2:
        emit(HomePage());
      case 3:
        emit(SavedPage());
      case 4:
        emit(ProfilePage());
    }
  }

  changePageTo({required int page}) {
    selectedPage = page;
    pageController.animateToPage(
      page,
      duration: Duration(milliseconds: 500),
      curve: Curves.easeInOut,
    );
    switch (page) {
      case 0:
        emit(ExplorePage());
      case 1:
        emit(TicketsPage());
      case 2:
        emit(HomePage());
      case 3:
        emit(SavedPage());
      case 4:
        emit(ProfilePage());
    }
  }
}
