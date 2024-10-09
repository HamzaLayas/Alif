// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'dart:io';

import 'package:alif/utils/constants/response_handler.dart';
import 'package:dio/dio.dart';
import 'package:alif/data/models/user_model.dart';
import 'package:alif/data/providers/user_provider.dart';

class UserRepo {
  final _userProvider = UserProvider();

  Future<ResponseHandler<UserModel>> getUserData() async {
    final response = await _userProvider.getUserData();
    if (response.statusCode == HttpStatus.ok) {
      return ResponseHandler(
        data: UserModel.fromMap(response.data['data']['user']),
      );
    } else {
      return ResponseHandler(error: response.data['message']);
    }
  }

  Future<ResponseHandler<UserModel>> updateUserData(
      {required FormData data}) async {
    final response = await _userProvider.updateUserData(data: data);
    if (response.statusCode == HttpStatus.ok) {
      return ResponseHandler(
        data: UserModel.fromMap(response.data['data']['user']),
      );
    } else {
      return ResponseHandler(error: response.data['message']);
    }
  }

  Future<ResponseHandler<UserModel>> updateUserPassword(
      {required Map<String, dynamic> map}) async {
    final response = await _userProvider.updateUserPassword(map: map);
    if (response.statusCode == HttpStatus.ok) {
      return ResponseHandler(
        data: UserModel.fromMap(response.data['data']['user']),
      );
    } else {
      return ResponseHandler(error: response.data['message']);
    }
  }
}
