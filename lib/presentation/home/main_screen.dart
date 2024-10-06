import 'package:alif/presentation/home/main_cubit/main_cubit.dart';
import 'package:alif/presentation/home/pages/explore_page_view.dart';
import 'package:alif/presentation/home/pages/home_page_view.dart';
import 'package:alif/presentation/home/pages/profile_page_view.dart';
import 'package:alif/presentation/home/pages/saved_page_view.dart';
import 'package:alif/presentation/home/pages/tickets_page_view.dart';
import 'package:alif/presentation/widgets/custom_appbar.dart';
import 'package:alif/presentation/widgets/custom_bottom_navbar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MainScreen extends StatelessWidget {
  const MainScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => MainCubit()),
        BlocProvider(create: (context) => MainCubit()),
        BlocProvider(create: (context) => MainCubit()),
        BlocProvider(create: (context) => MainCubit()),
        BlocProvider(create: (context) => MainCubit()),
        BlocProvider(create: (context) => MainCubit()),
      ],
      child: MainScreenView(),
    );
  }
}

class MainScreenView extends StatelessWidget {
  const MainScreenView({super.key});

  @override
  Widget build(BuildContext context) {
    final mainCubit = context.read<MainCubit>();
    
    // final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;
    return BlocConsumer<MainCubit, MainState>(
      listener: (context, state) {},
      builder: (context, state) {
        return Scaffold(
          extendBody: true,
          extendBodyBehindAppBar: true,
          appBar: CustomeAppBar(
            height: height,
            child: Row(),
          ),
          body: PageView(
            controller: mainCubit.pageController,
            onPageChanged: (page) => mainCubit.updateNavBar(page: page),
            children: [
              ExplorePageView(),
              TicketsPageView(),
              HomePageView(),
              SavedPageView(),
              ProfilePageView(),
            ],
          ),
          bottomNavigationBar: CustomBotNavBar(
            onTap: (page) => mainCubit.changePageTo(page: page),
            selectedPage: mainCubit.selectedPage,
          ),
        );
      },
    );
  }
}
