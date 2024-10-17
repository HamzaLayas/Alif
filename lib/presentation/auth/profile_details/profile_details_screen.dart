import 'dart:typed_data';

import 'package:alif/presentation/auth/profile_details/profile_details_cubit/profile_details_cubit.dart';
import 'package:alif/presentation/widgets/auth_widgets/custom_elevated_button.dart';
import 'package:alif/presentation/widgets/custom_gradient_shader.dart';
import 'package:alif/presentation/widgets/custom_scaffold.dart';
import 'package:alif/presentation/widgets/show_error.dart';
import 'package:alif/presentation/widgets/show_loading_dialog.dart';
import 'package:alif/utils/constants/api_constants.dart';
import 'package:alif/utils/constants/validation_extension.dart';
import 'package:alif/utils/cubits/user_cubit/user_cubit.dart';
import 'package:alif/utils/style/alif_icons.dart';
import 'package:alif/utils/style/colors.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';

class ProfileDetailsScreen extends StatelessWidget {
  ProfileDetailsScreen({super.key});
  final _getIt = GetIt.I;

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => ProfileDetailsCubit()),
        BlocProvider(create: (context) => _getIt.get<UserCubit>()),
      ],
      child: ProfileDetailsScreenView(),
    );
  }
}

class ProfileDetailsScreenView extends StatelessWidget {
  const ProfileDetailsScreenView({super.key});

  @override
  Widget build(BuildContext context) {
    final userCubit = context.read<UserCubit>();
    final profileDetailsCubit = context.read<ProfileDetailsCubit>();
    final width = MediaQuery.of(context).size.width;
    return CustomScaffold(
      title: "تعديل البيانات الشخصية",
      child: BlocListener<ProfileDetailsCubit, ProfileDetailsState>(
        listener: (context, state) {
          switch (state) {
            case ProfileDetailsLoading():
              showLoadingDialog(context);
              break;
            case ProfileDetailsFailure():
              Navigator.pop(context);
              showSnackBar(state.error, context);
              break;
            case ProfileDetailsSuccess():
              Navigator.popUntil(
                context,
                (route) => route.isFirst,
              );
              break;
            case ProfileDetailsInitial():
            case ProfileDetailsImageLoaded():
              break;
          }
        },
        child: Padding(
          padding: EdgeInsetsDirectional.symmetric(horizontal: width * 0.03),
          child: Form(
            key: userCubit.detailsFormKey,
            child: Column(
              mainAxisSize: MainAxisSize.max,
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Spacer(flex: 4),
                BlocBuilder<ProfileDetailsCubit, ProfileDetailsState>(
                  builder: (context, state) {
                    return InkWell(
                      onTap: () async {
                        await profileDetailsCubit.getImageGallery();
                      },
                      focusColor: AppColors.transparent,
                      hoverColor: AppColors.transparent,
                      splashColor: AppColors.transparent,
                      highlightColor: AppColors.transparent,
                      child: Stack(
                        children: [
                          SizedBox(
                            width: width * 0.4,
                            child: AspectRatio(
                              aspectRatio: 1,
                              child: Container(
                                decoration: BoxDecoration(
                                  color: AppColors.transparent,
                                  shape: BoxShape.circle,
                                  border: Border.all(
                                    width: 2,
                                    color: AppColors.onSecondary,
                                  ),
                                ),
                                child: ClipOval(
                                  child: profileDetailsCubit.image != null &&
                                          profileDetailsCubit.image!.isNotEmpty
                                      ? Image.memory(
                                          Uint8List.fromList(
                                              profileDetailsCubit.image!),
                                          fit: BoxFit.fitWidth,
                                          alignment:
                                              AlignmentDirectional.center,
                                        )
                                      : CachedNetworkImage(
                                          imageUrl:
                                              userCubit.currentUser?.image != null
                                                  ? ApiConstants.getImagePath(
                                                      userCubit.currentUser!.image!,
                                                    )
                                                  : '',
                                          fit: BoxFit.fitWidth,
                                          alignment: Alignment.center,
                                          placeholder: (context, url) =>
                                              Image.asset(
                                            "lib/assets/images/profile.jpg",
                                            fit: BoxFit.fitWidth,
                                            alignment:
                                                AlignmentDirectional.center,
                                          ),
                                          errorWidget: (context, url, error) =>
                                              Image.asset(
                                            "lib/assets/images/profile.jpg",
                                            fit: BoxFit.fitWidth,
                                            alignment:
                                                AlignmentDirectional.center,
                                          ),
                                        ),
                                ),
                              ),
                            ),
                          ),
                          Positioned.directional(
                            bottom: 0,
                            start: 0,
                            textDirection: TextDirection.rtl,
                            child: Container(
                              padding: EdgeInsets.all(2.5).copyWith(left: 5),
                              decoration: BoxDecoration(
                                color: AppColors.surface,
                                borderRadius: BorderRadius.circular(12),
                                border: Border.all(
                                  width: 2,
                                  color: AppColors.onSecondary,
                                ),
                              ),
                              child: CustomGradientShader(
                                child: Icon(
                                  AlifIcons.edit,
                                  size: 35,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    );
                  },
                ),
                Spacer(flex: 2),
                Align(
                  alignment: AlignmentDirectional.centerStart,
                  child: Text(
                    "الإسم و اللقب",
                    style: Theme.of(context).textTheme.titleLarge!.copyWith(
                          color: AppColors.onSurface,
                          fontWeight: FontWeight.w600,
                        ),
                  ),
                ),
                TextFormField(
                  controller: userCubit.nameController,
                  enableSuggestions: true,
                  keyboardType: TextInputType.name,
                  textCapitalization: TextCapitalization.words,
                  style: Theme.of(context)
                      .textTheme
                      .titleLarge!
                      .copyWith(color: AppColors.onSurface),
                  decoration: InputDecoration(
                    hintText: "الإسم و اللقب",
                    hintStyle: Theme.of(context)
                        .textTheme
                        .titleLarge!
                        .copyWith(color: AppColors.onSurfaceVariant),
                    prefixIcon: const Icon(
                      AlifIcons.user_outlined,
                      size: 30,
                    ),
                  ),
                  onTapOutside: (event) => FocusScope.of(context).unfocus(),
                  validator: (value) => value!.fullNameValidator(),
                ),
                Spacer(flex: 1),
                Align(
                  alignment: AlignmentDirectional.centerStart,
                  child: Text(
                    "رقم الهاتف",
                    style: Theme.of(context).textTheme.titleLarge!.copyWith(
                          color: AppColors.onSurface,
                          fontWeight: FontWeight.w600,
                        ),
                  ),
                ),
                TextFormField(
                  controller: userCubit.phoneController,
                  keyboardType: TextInputType.phone,
                  style: Theme.of(context)
                      .textTheme
                      .titleLarge!
                      .copyWith(color: AppColors.onSurface),
                  decoration: InputDecoration(
                    hintText: "رقم الهاتف",
                    hintStyle: Theme.of(context)
                        .textTheme
                        .titleLarge!
                        .copyWith(color: AppColors.onSurfaceVariant),
                    prefixIcon: const Icon(
                      AlifIcons.phone_outlined,
                      size: 30,
                    ),
                  ),
                  onTapOutside: (event) => FocusScope.of(context).unfocus(),
                  validator: (value) => value!.phoneValidation(),
                ),
                Spacer(flex: 3),
                CustomElevatedButton(
                  text: "تعديل",
                  onTap: () => profileDetailsCubit
                      .updateUserDetails(userCubit.updateUserDetails),
                ),
                Spacer(flex: 20),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
