import 'package:alif/data/models/user_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:shared_preferences/shared_preferences.dart';
part 'splash_state.dart';

class SplashCubit extends Cubit<SplashState> {
  getSharedPreferences() async {}

  SplashCubit() : super(SplashInitial());

  UserModel? currentUser;

  late bool _isFirstTimeUser;

  getCurrentUser(Future<UserModel?> Function() getCurrentUser) async {
    await Future.wait([
      SharedPreferences.getInstance().then(
        (value) => _isFirstTimeUser = value.containsKey('repeatUser'),
      ),
      getCurrentUser().then((value) => currentUser = value),
      Future.delayed(Duration(seconds: 4)),
    ]).then((value) {
      if (!_isFirstTimeUser) {
        if (currentUser != null) {
          emit(SplashAuthenticated(currentUser: currentUser!));
        } else {
          emit(SplashUnAuthenticated());
        }
      } else {
        emit(SplashFirstTimeUser());
      }
    });
  }
}
