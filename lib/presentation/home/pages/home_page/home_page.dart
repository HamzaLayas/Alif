import 'package:alif/presentation/home/pages/home_page/home_cubit/home_cubit.dart';
import 'package:alif/presentation/widgets/main_widgets/custom_appbar.dart';
import 'package:alif/utils/cubits/user_cubit/user_cubit.dart';
import 'package:alif/utils/style/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';

class HomePage extends StatelessWidget {
  HomePage({super.key});
  final _getIt = GetIt.I;

  @override
  Widget build(BuildContext context) {
    // final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => HomeCubit()),
        BlocProvider(create: (context) => _getIt.get<UserCubit>()),
      ],
      child: Scaffold(
        extendBodyBehindAppBar: true,
        resizeToAvoidBottomInset: false,
        backgroundColor: AppColors.secondary,
        appBar: CustomeAppBar(
          height: height,
          child: SizedBox.shrink(),
        ),
        body: const Column(),
      ),
    );
  }
}
