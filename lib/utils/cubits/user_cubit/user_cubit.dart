import 'package:alif/data/models/user_model.dart';
import 'package:alif/data/repositories/user_repo.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';

part 'user_state.dart';

class UserCubit extends Cubit<UserState> {
  UserModel? currentUser;
  UserCubit() : super(UserInitial());

  final _userRepo = GetIt.I.get<UserRepo>();

  Future<UserModel?> getUserData() async {
    currentUser = await _userRepo.getUserData();
    return currentUser;
  }

  Future<UserModel?> updateUserData() async {
    emit(UserLoading());
    currentUser = await _userRepo.getUserData();
    emit(UserLoaded());
    return currentUser;
  }
}
