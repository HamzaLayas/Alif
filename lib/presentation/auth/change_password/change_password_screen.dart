import 'package:alif/presentation/auth/change_password/change_password_cubit/change_password_cubit.dart';
import 'package:alif/presentation/widgets/auth_widgets/custom_elevated_button.dart';
import 'package:alif/presentation/widgets/custom_scaffold.dart';
import 'package:alif/presentation/widgets/show_error.dart';
import 'package:alif/presentation/widgets/show_loading_dialog.dart';
import 'package:alif/utils/constants/validation_extension.dart';
import 'package:alif/utils/cubits/user_cubit/user_cubit.dart';
import 'package:alif/utils/style/alif_icons.dart';
import 'package:alif/utils/style/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get_it/get_it.dart';

class ChangePasswordScreen extends StatelessWidget {
  ChangePasswordScreen({super.key});
  final _getIt = GetIt.I;

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => ChangePasswordCubit(),
        ),
        BlocProvider(
          create: (context) => _getIt.get<UserCubit>(),
        ),
      ],
      child: ChangePasswordScreenView(),
    );
  }
}

class ChangePasswordScreenView extends StatelessWidget {
  const ChangePasswordScreenView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final userCubit = context.read<UserCubit>();
    final changePasswordCubit = context.read<ChangePasswordCubit>();
    final width = MediaQuery.of(context).size.width;
    return CustomScaffold(
      title: "تغير كلمة المرور",
      child: BlocListener<ChangePasswordCubit, ChangePasswordState>(
        listener: (context, state) {
          switch (state) {
            case ChangePasswordLoading():
              showLoadingDialog(context);
              break;
            case ChangePasswordFailure():
              Navigator.pop(context);
              showSnackBar(state.error, context);
              break;
            case ChangePasswordSuccess():
              Navigator.popUntil(
                context,
                (route) => route.isFirst,
              );
              break;
            case ChangePasswordInitial():
            case ChangePasswordVisibilityToggle():
              break;
          }
        },
        child: Padding(
          padding: EdgeInsetsDirectional.symmetric(horizontal: width * 0.03),
          child: Form(
            key: userCubit.passwordFormKey,
            child: Column(
              mainAxisSize: MainAxisSize.max,
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Spacer(flex: 1),
                SvgPicture.asset(
                  'lib/assets/svg/change_password.svg',
                  width: width * 0.75,
                  fit: BoxFit.fitWidth,
                ),
                Spacer(flex: 2),
                Align(
                  alignment: AlignmentDirectional.centerStart,
                  child: Text(
                    "كلمة المرور القديمة",
                    style: Theme.of(context).textTheme.titleLarge!.copyWith(
                          color: AppColors.onSurface,
                          fontWeight: FontWeight.w600,
                        ),
                  ),
                ),
                BlocBuilder<ChangePasswordCubit, ChangePasswordState>(
                  builder: (context, state) {
                    return TextFormField(
                      controller: userCubit.oldPasswordController,
                      obscureText: changePasswordCubit.isoldPasswordObscured,
                      keyboardType: TextInputType.text,
                      style: Theme.of(context)
                          .textTheme
                          .titleLarge!
                          .copyWith(color: AppColors.onSurface),
                      decoration: InputDecoration(
                        hintText: "كلمة المرور القديمة",
                        hintStyle: Theme.of(context)
                            .textTheme
                            .titleLarge!
                            .copyWith(color: AppColors.onSurfaceVariant),
                        prefixIcon: const Icon(
                          AlifIcons.password,
                          size: 30,
                        ),
                        suffixIcon: InkWell(
                          onTap: changePasswordCubit.obscureOldPasswordToggle,
                          splashColor: AppColors.secondary,
                          borderRadius: BorderRadius.circular(50),
                          child: Icon(
                            changePasswordCubit.oldPasswordIcon,
                            size: 30,
                          ),
                        ),
                      ),
                      onTapOutside: (event) => FocusScope.of(context).unfocus(),
                      validator: (value) => value!.passwordValidation(),
                    );
                  },
                ),
                Spacer(flex: 1),
                Align(
                  alignment: AlignmentDirectional.centerStart,
                  child: Text(
                    "كلمة المرور الجديدة",
                    style: Theme.of(context).textTheme.titleLarge!.copyWith(
                          color: AppColors.onSurface,
                          fontWeight: FontWeight.w600,
                        ),
                  ),
                ),
                BlocBuilder<ChangePasswordCubit, ChangePasswordState>(
                  builder: (context, state) {
                    return TextFormField(
                      controller: userCubit.newPasswordController,
                      obscureText: changePasswordCubit.isNewPasswordObscured,
                      keyboardType: TextInputType.text,
                      style: Theme.of(context)
                          .textTheme
                          .titleLarge!
                          .copyWith(color: AppColors.onSurface),
                      decoration: InputDecoration(
                        hintText: "كلمة المرور الجديدة",
                        hintStyle: Theme.of(context)
                            .textTheme
                            .titleLarge!
                            .copyWith(color: AppColors.onSurfaceVariant),
                        prefixIcon: const Icon(
                          AlifIcons.password,
                          size: 30,
                        ),
                        suffixIcon: InkWell(
                          onTap: changePasswordCubit.obscureNewPasswordToggle,
                          splashColor: AppColors.secondary,
                          borderRadius: BorderRadius.circular(50),
                          child: Icon(
                            changePasswordCubit.newPasswordIcon,
                            size: 30,
                          ),
                        ),
                      ),
                      onTapOutside: (event) => FocusScope.of(context).unfocus(),
                      validator: (value) => value!.passwordValidation(),
                    );
                  },
                ),
                Spacer(flex: 1),
                Align(
                  alignment: AlignmentDirectional.centerStart,
                  child: Text(
                    "تأكيد كلمة المرور الجديدة",
                    style: Theme.of(context).textTheme.titleLarge!.copyWith(
                          color: AppColors.onSurface,
                          fontWeight: FontWeight.w600,
                        ),
                  ),
                ),
                BlocBuilder<ChangePasswordCubit, ChangePasswordState>(
                  builder: (context, state) => TextFormField(
                    controller: userCubit.confirmNewPasswordController,
                    obscureText:
                        changePasswordCubit.isConfirmNewPasswordObscured,
                    keyboardType: TextInputType.text,
                    style: Theme.of(context)
                        .textTheme
                        .titleLarge!
                        .copyWith(color: AppColors.onSurface),
                    decoration: InputDecoration(
                      hintText: "تأكيد كلمة المرور الجديدة",
                      hintStyle: Theme.of(context)
                          .textTheme
                          .titleLarge!
                          .copyWith(color: AppColors.onSurfaceVariant),
                      prefixIcon: const Icon(
                        AlifIcons.password,
                        size: 30,
                      ),
                      suffixIcon: InkWell(
                        onTap:
                            changePasswordCubit.obscureConfirmNewPasswordToggle,
                        splashColor: AppColors.secondary,
                        borderRadius: BorderRadius.circular(50),
                        child: Icon(
                          changePasswordCubit.confirmNewPasswordIcon,
                          size: 30,
                        ),
                      ),
                    ),
                    onTapOutside: (event) => FocusScope.of(context).unfocus(),
                    validator: (value) => value!.confirmPasswordValidation(
                      newPassController:
                          userCubit.newPasswordController.text.trim(),
                    ),
                  ),
                ),
                Spacer(flex: 5),
                CustomElevatedButton(
                  text: "تغير",
                  onTap: () => changePasswordCubit
                      .updateUserPassword(userCubit.updateUserPassword),
                ),
                Spacer(flex: 10),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
