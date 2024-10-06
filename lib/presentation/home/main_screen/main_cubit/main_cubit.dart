import 'package:alif/data/models/user_model.dart';
import 'package:alif/data/repositories/user_repo.dart';
import 'package:alif/presentation/home/pages/home_page/home_page.dart';
import 'package:alif/presentation/home/pages/explore_page/explore_page.dart';
import 'package:alif/presentation/home/pages/profile_page/profile_page.dart';
import 'package:alif/presentation/home/pages/saved_page/saved_page.dart';
import 'package:alif/presentation/home/pages/tickets_page/tickets_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
part 'main_state.dart';

class MainCubit extends Cubit<MainState> {
  int selectedPage = 2;
  final PageController pageController = PageController(initialPage: 2);
  final List<Widget> pages = [
    ExplorePage(),
    TicketsPage(),
    HomePage(),
    SavedPage(),
    ProfilePage(),
  ];

  final _userRepo = GetIt.I.get<UserRepo>();

  UserModel? currentUser;

  MainCubit() : super(MainInitial()) {
    getUser();
  }

  getUser() async {
    await _userRepo.getUserData().then((value) {
      currentUser = value;
      emit(HomePageState());
    });
  }

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
