import 'package:alif/data/models/user_model.dart';
import 'package:alif/data/repositories/user_repo.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:http_parser/http_parser.dart';
import 'package:equatable/equatable.dart';

part 'user_state.dart';

class UserCubit extends Cubit<UserState> {
  final detailsFormKey = GlobalKey<FormState>();
  final TextEditingController nameController = TextEditingController();
  final TextEditingController phoneController = TextEditingController();

  final emailFormKey = GlobalKey<FormState>();
  final TextEditingController oldEmailController = TextEditingController();
  final TextEditingController emailCodeController = TextEditingController();
  final TextEditingController newEmailController = TextEditingController();

  final passwordFormKey = GlobalKey<FormState>();
  final TextEditingController oldPasswordController = TextEditingController();
  final TextEditingController newPasswordController = TextEditingController();
  final TextEditingController confirmNewPasswordController =
      TextEditingController();

  UserCubit() : super(UserInitial());

  UserModel? currentUser;
  final _userRepo = GetIt.I.get<UserRepo>();

  void updateCurrentUser(UserModel newUser) {
    emit(UserLoading());
    currentUser = newUser;
    nameController.text = currentUser?.name ?? '';
    phoneController.text = currentUser?.phone ?? '';
    Future.delayed(Duration(milliseconds: 300)).then(
      (value) => emit(UserLoaded()),
    );
  }

  Future<String?> getUserData() async {
    final response = await _userRepo.getUserData();
    if (response.data != null) {
      updateCurrentUser(response.data!);
      return null;
    } else {
      return response.error;
    }
  }

  Future<String?> updateUserDetails(
      {required List<int>? imageFromBytes}) async {
    final bool isValidated = detailsFormKey.currentState!.validate();
    if (isValidated) {
      currentUser!.name = nameController.text.trim();
      currentUser!.phone = phoneController.text.trim();
      final currentUserMap = currentUser!.toMap();
      final FormData formData = FormData.fromMap(currentUserMap);
      if (imageFromBytes != null) {
        final multiPartFile = MultipartFile.fromBytes(
          imageFromBytes,
          filename: 'image.jpg',
          contentType: MediaType('image', 'jpeg'),
        );
        formData.files.add(MapEntry('image', multiPartFile));
      }
      final response = await _userRepo.updateUserData(data: formData);
      if (response.data != null) {
        updateCurrentUser(response.data!);
        return null;
      } else {
        return response.error;
      }
    }
    return "الرجاء إدخال بيانات صحيحة";
  }

  Future<String?> updateUserPassword() async {
    final bool isValidated = passwordFormKey.currentState!.validate();
    if (isValidated) {
      final currentPassword = oldPasswordController.text.trim();
      final newPassword = newPasswordController.text.trim();
      final response = await _userRepo.updateUserPassword(map: {
        "currentPassword": currentPassword,
        "newPassword": newPassword,
      });

      if (response.data != null) {
        return null;
      } else {
        return response.error;
      }
    }
    return "الرجاء إدخال بيانات صحيحة";
  }
}
