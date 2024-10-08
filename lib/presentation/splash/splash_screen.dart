import 'package:alif/presentation/splash/splash_cubit/splash_cubit.dart';
import 'package:alif/utils/cubits/user_cubit/user_cubit.dart';
import 'package:alif/utils/style/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  final _getIt = GetIt.I;

  userCubitInit() {
    if (_getIt.isRegistered<UserCubit>()) {
      _getIt.unregister<UserCubit>();
    }
    _getIt.registerLazySingleton<UserCubit>(() => UserCubit());
  }

  @override
  void initState() {
    userCubitInit();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => SplashCubit()),
        BlocProvider(create: (context) => _getIt.get<UserCubit>()),
      ],
      child: SplashScreenView(),
    );
  }
}

class SplashScreenView extends StatelessWidget {
  const SplashScreenView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final splashCubit = context.read<SplashCubit>();
    final userCubit = context.read<UserCubit>();
    splashCubit.getCurrentUser(userCubit.getUserData);
    return BlocListener<SplashCubit, SplashState>(
      listener: (context, state) {
        if (state is SplashFirstTimeUser) {
          Navigator.pushReplacementNamed(context, '/login');
        }
        if (state is SplashAuthenticated) {
          Navigator.pushReplacementNamed(context, '/main');
        }
        if (state is SplashUnAuthenticated) {
          Navigator.pushReplacementNamed(context, '/login');
        }
      },
      child: Scaffold(
        backgroundColor: AppColors.secondary,
        body: Center(
          child: Image.asset(
            'lib/assets/splash.gif',
            fit: BoxFit.fitWidth,
          ),
        ),
      ),
    );
  }
}
