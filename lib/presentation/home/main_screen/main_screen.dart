import 'package:alif/presentation/home/main_screen/main_cubit/main_cubit.dart';
import 'package:alif/presentation/widgets/custom_bottom_navbar.dart';
import 'package:alif/utils/style/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MainScreen extends StatelessWidget {
  const MainScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => MainCubit(),
      child: MainScreenView(),
    );
  }
}

class MainScreenView extends StatelessWidget {
  const MainScreenView({super.key});

  @override
  Widget build(BuildContext context) {
    final cubit = context.read<MainCubit>();
    return BlocBuilder<MainCubit, MainState>(
      builder: (context, state) {
        return Scaffold(
          extendBody: true,
          backgroundColor: AppColors.transparent,
          body: PageView(
            controller: cubit.pageController,
            physics: NeverScrollableScrollPhysics(),
            children: cubit.pages,
          ),
          bottomNavigationBar: CustomBotNavBar(
            onTap: (page) => cubit.changePageTo(page: page),
            selectedPage: cubit.selectedPage,
          ),
        );
      },
    );
  }
}
