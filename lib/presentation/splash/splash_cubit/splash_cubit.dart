import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:shared_preferences/shared_preferences.dart';
part 'splash_state.dart';

class SplashCubit extends Cubit<SplashState> {
  getSharedPreferences() async {}

  SplashCubit() : super(SplashInitial());

  late bool _isFirstTimeUser;

  getCurrentUser(Future<String?> Function() getCurrentUser) async {
    String? error;
    await Future.wait([
      SharedPreferences.getInstance().then(
        (value) => _isFirstTimeUser = value.containsKey('repeatUser'),
      ),
      getCurrentUser().then((value) => error = value),
      Future.delayed(Duration(seconds: 4)),
    ]).then((value) {
      if (!_isFirstTimeUser) {
        if (error == null) {
          emit(SplashAuthenticated());
        } else {
          emit(SplashUnAuthenticated());
        }
      } else {
        emit(SplashFirstTimeUser());
      }
    });
  }
}
