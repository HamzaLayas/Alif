import 'package:alif/presentation/home/pages/explore_page/explore_cubit/explore_cubit.dart';
import 'package:alif/presentation/widgets/custom_appbar.dart';
import 'package:alif/utils/cubits/user_cubit/user_cubit.dart';
import 'package:alif/utils/style/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';

class ExplorePage extends StatelessWidget {
  ExplorePage({super.key});
  final _getIt = GetIt.I;

  @override
  Widget build(BuildContext context) {
    // final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => ExploreCubit()),
        BlocProvider(create: (context) => _getIt.get<UserCubit>()),
      ],
      child: Scaffold(
        extendBodyBehindAppBar: true,
        backgroundColor: AppColors.secondary,
        appBar: CustomeAppBar(
          height: height,
          child: SizedBox.shrink(),
        ),
        body: const Placeholder(),
      ),
    );
  }
}