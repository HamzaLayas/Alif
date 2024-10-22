import 'dart:typed_data';
import 'package:alif/utils/style/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_cropper/image_cropper.dart';
import 'package:image_picker/image_picker.dart';

part 'profile_details_state.dart';

class ProfileDetailsCubit extends Cubit<ProfileDetailsState> {
  ProfileDetailsCubit() : super(ProfileDetailsInitial());

  List<int>? image;

  Future<void> getImageGallery() async {
    final picker = ImagePicker();
    emit(ProfileDetailsInitial ());

    final imageFile = await picker.pickImage(source: ImageSource.gallery);

    if (imageFile != null) {
      CroppedFile? croppedFile = await ImageCropper().cropImage(
        sourcePath: imageFile.path,
        maxWidth: 512,
        maxHeight: 512,
        uiSettings: [
          AndroidUiSettings(
            toolbarColor: AppColors.onPrimary,
            toolbarTitle: 'أَلِفْ',
            backgroundColor: AppColors.secondary,
            toolbarWidgetColor: AppColors.surface,
            initAspectRatio: CropAspectRatioPreset.square,
            lockAspectRatio: true,
            showCropGrid: true,
            aspectRatioPresets: [CropAspectRatioPreset.square],
          ),
          IOSUiSettings(
            minimumAspectRatio: 1.0,
            aspectRatioPresets: [CropAspectRatioPreset.square],
            aspectRatioLockEnabled: true,
            aspectRatioPickerButtonHidden: true,
          ),
        ],
      );
      if (croppedFile != null) {
        final Uint8List imageBytes = await croppedFile.readAsBytes();
        image = imageBytes.toList();
        emit(ProfileDetailsImageLoaded());
      }
    }
    emit(ProfileDetailsImageLoaded());
  }

  Future<void> updateUserDetails(
    Future<String?> Function({required List<int>? imageFromBytes})
        updateCurrentUser,
  ) async {
    emit(ProfileDetailsLoading());
    final String? errorMessage = await updateCurrentUser(imageFromBytes: image);
    if (errorMessage == null) {
      emit(ProfileDetailsSuccess());
    } else {
      emit(ProfileDetailsFailure(errorMessage));
    }
  }
}
