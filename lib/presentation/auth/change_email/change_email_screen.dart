import 'package:alif/presentation/auth/change_email/change_email_cubit/change_email_cubit.dart';
import 'package:alif/presentation/widgets/auth_widgets/custom_elevated_button.dart';
import 'package:alif/presentation/widgets/custom_gradient_shader.dart';
import 'package:alif/presentation/widgets/custom_scaffold.dart';
import 'package:alif/utils/constants/validation_extension.dart';
import 'package:alif/utils/cubits/user_cubit/user_cubit.dart';
import 'package:alif/utils/style/alif_icons.dart';
import 'package:alif/utils/style/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';

class ChangeEmailScreen extends StatelessWidget {
  const ChangeEmailScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ChangeEmailCubit(),
      child: ChangeEmailScreenView(),
    );
  }
}

class ChangeEmailScreenView extends StatelessWidget {
  const ChangeEmailScreenView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final userCubit = context.read<UserCubit>();
    final changeEmailCubit = context.read<ChangeEmailCubit>();
    final width = MediaQuery.of(context).size.width;
    return CustomScaffold(
      title: "تغير البريد الإلكتروني",
      child: BlocListener<ChangeEmailCubit, ChangeEmailState>(
        listener: (context, state) {},
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
                  'lib/assets/svg/change_email.svg',
                  width: width * 0.75,
                  fit: BoxFit.fitWidth,
                ),
                Spacer(flex: 2),
                Align(
                  alignment: AlignmentDirectional.centerStart,
                  child: Text(
                    "البريد الإلكتروني القديمة",
                    style: Theme.of(context).textTheme.titleLarge!.copyWith(
                          color: AppColors.onSurface,
                          fontWeight: FontWeight.w600,
                        ),
                  ),
                ),
                TextFormField(
                  controller: userCubit.oldEmailController,
                  enableSuggestions: true,
                  keyboardType: TextInputType.emailAddress,
                  style: Theme.of(context)
                      .textTheme
                      .titleLarge!
                      .copyWith(color: AppColors.onSurface),
                  decoration: InputDecoration(
                    hintText: "البريد الإلكتروني",
                    hintStyle: Theme.of(context)
                        .textTheme
                        .titleLarge!
                        .copyWith(color: AppColors.onSurfaceVariant),
                    prefixIcon: const Icon(
                      AlifIcons.mail,
                      size: 30,
                    ),
                  ),
                  onTapOutside: (event) => FocusScope.of(context).unfocus(),
                  validator: (value) => value!.emailValidation(),
                ),
                Spacer(flex: 1),
                Align(
                  alignment: AlignmentDirectional.centerStart,
                  child: Text(
                    "رمز التحقق",
                    style: Theme.of(context).textTheme.titleLarge!.copyWith(
                          color: AppColors.onSurface,
                          fontWeight: FontWeight.w600,
                        ),
                  ),
                ),
                Row(
                  children: [
                    Expanded(
                      flex: 9,
                      child: TextFormField(
                        controller: userCubit.emailCodeController,
                        enableSuggestions: true,
                        keyboardType: TextInputType.emailAddress,
                        style: Theme.of(context)
                            .textTheme
                            .titleLarge!
                            .copyWith(color: AppColors.onSurface),
                        decoration: InputDecoration(
                          hintText: "رمز التحقق",
                          hintStyle: Theme.of(context)
                              .textTheme
                              .titleLarge!
                              .copyWith(color: AppColors.onSurfaceVariant),
                          prefixIcon: const Icon(
                            AlifIcons.key,
                            size: 30,
                          ),
                        ),
                        onTapOutside: (event) =>
                            FocusScope.of(context).unfocus(),
                        validator: (value) => value!.emailValidation(),
                      ),
                    ),
                    Expanded(
                      flex: 3,
                      child: CustomGradientShader(
                        child: TextButton(
                          onPressed: () {},
                          child: Text(
                            "أرسل الرمز",
                            style: Theme.of(context)
                                .textTheme
                                .titleLarge!
                                .copyWith(
                                    color: AppColors.onSurface,
                                    fontWeight: FontWeight.w600),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                Spacer(flex: 1),
                Align(
                  alignment: AlignmentDirectional.centerStart,
                  child: Text(
                    "البريد الإلكتروني الجديدة",
                    style: Theme.of(context).textTheme.titleLarge!.copyWith(
                          color: AppColors.onSurface,
                          fontWeight: FontWeight.w600,
                        ),
                  ),
                ),
                TextFormField(
                  controller: userCubit.newEmailController,
                  enableSuggestions: true,
                  keyboardType: TextInputType.emailAddress,
                  style: Theme.of(context)
                      .textTheme
                      .titleLarge!
                      .copyWith(color: AppColors.onSurface),
                  decoration: InputDecoration(
                    hintText: "البريد الإلكتروني",
                    hintStyle: Theme.of(context)
                        .textTheme
                        .titleLarge!
                        .copyWith(color: AppColors.onSurfaceVariant),
                    prefixIcon: const Icon(
                      AlifIcons.mail,
                      size: 30,
                    ),
                  ),
                  onTapOutside: (event) => FocusScope.of(context).unfocus(),
                  validator: (value) => value!.emailValidation(),
                ),
                Spacer(flex: 5),
                CustomElevatedButton(
                  text: "تغير",
                  onTap: () => changeEmailCubit
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
