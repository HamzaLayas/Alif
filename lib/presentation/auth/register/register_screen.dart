import 'package:alif/presentation/auth/register/register_cubit/register_cubit.dart';
import 'package:alif/presentation/widgets/auth_widgets/custom_auth_scaffold.dart';
import 'package:alif/presentation/widgets/auth_widgets/custom_elevated_button.dart';
import 'package:alif/presentation/widgets/custom_gradient_shader.dart';
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

class RegisterScreen extends StatelessWidget {
  RegisterScreen({super.key});
  final _getIt = GetIt.I;

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => RegisterCubit()),
        BlocProvider(create: (context) => _getIt.get<UserCubit>()),
      ],
      child: RegisterScreenView(),
    );
  }
}

class RegisterScreenView extends StatelessWidget {
  const RegisterScreenView({super.key});

  @override
  Widget build(BuildContext context) {
    final registerCubit = context.read<RegisterCubit>();
    final userCubit = context.read<UserCubit>();
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;
    return CustomAuthScaffold(
      child: Padding(
        padding: EdgeInsetsDirectional.symmetric(horizontal: width * 0.03),
        child: BlocListener<RegisterCubit, RegisterState>(
          listener: (context, state) {
            switch (state) {
              case RegisterLoading():
                showLoadingDialog(context);
                Future.delayed(Duration(seconds: 1));
                break;
              case RegisterSuccess():
                Navigator.pop(context);
                Navigator.pushReplacementNamed(context, "/main");
                break;
              case RegisterFailure():
                Navigator.pop(context);
                showSnackBar(state.error, context);
                break;
              case RegisterInitial():
              case RegisterPasswordVisiblityToggle():
                break;
            }
          },
          child: Form(
            key: registerCubit.formKey,
            child: ListView(
              children: <Widget>[
                Padding(
                  padding: EdgeInsetsDirectional.only(bottom: height * 0.02),
                  child: Text(
                    'إنشاء حساب',
                    style: Theme.of(context).textTheme.headlineLarge!.copyWith(
                        color: AppColors.onSurface,
                        fontWeight: FontWeight.w600),
                  ),
                ),
                TextFormField(
                  controller: registerCubit.nameController,
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
                      AlifIcons.user_outline,
                      size: 30,
                    ),
                  ),
                  onTapOutside: (event) => FocusScope.of(context).unfocus(),
                  validator: (value) => value!.fullNameValidator(),
                ),
                Padding(
                  padding:
                      EdgeInsetsDirectional.symmetric(vertical: height * 0.02),
                  child: TextFormField(
                    controller: registerCubit.emailController,
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
                ),
                BlocBuilder<RegisterCubit, RegisterState>(
                  builder: (context, state) {
                    return TextFormField(
                      controller: registerCubit.passwordController,
                      obscureText: registerCubit.isPasswordObscured,
                      keyboardType: TextInputType.text,
                      style: Theme.of(context)
                          .textTheme
                          .titleLarge!
                          .copyWith(color: AppColors.onSurface),
                      decoration: InputDecoration(
                        hintText: "كلمة المرور",
                        hintStyle: Theme.of(context)
                            .textTheme
                            .titleLarge!
                            .copyWith(color: AppColors.onSurfaceVariant),
                        prefixIcon: const Icon(
                          AlifIcons.password,
                          size: 30,
                        ),
                        suffixIcon: InkWell(
                          onTap: registerCubit.obscurePasswordToggle,
                          splashColor: AppColors.secondary,
                          borderRadius: BorderRadius.circular(50),
                          child: Icon(
                            registerCubit.passwordIcon,
                            size: 30,
                          ),
                        ),
                      ),
                      onTapOutside: (event) => FocusScope.of(context).unfocus(),
                      validator: (value) => value!.passwordValidation(),
                    );
                  },
                ),
                Padding(
                  padding:
                      EdgeInsetsDirectional.symmetric(vertical: height * 0.02),
                  child: BlocBuilder<RegisterCubit, RegisterState>(
                    builder: (context, state) => TextFormField(
                      controller: registerCubit.confirmPasswordController,
                      obscureText: registerCubit.isConfirmObscured,
                      keyboardType: TextInputType.text,
                      style: Theme.of(context)
                          .textTheme
                          .titleLarge!
                          .copyWith(color: AppColors.onSurface),
                      decoration: InputDecoration(
                        hintText: "تأكيد كلمة المرور",
                        hintStyle: Theme.of(context)
                            .textTheme
                            .titleLarge!
                            .copyWith(color: AppColors.onSurfaceVariant),
                        prefixIcon: const Icon(
                          AlifIcons.password,
                          size: 30,
                        ),
                        suffixIcon: InkWell(
                          onTap: registerCubit.obscureConfirmToggle,
                          splashColor: AppColors.secondary,
                          borderRadius: BorderRadius.circular(50),
                          child: Icon(
                            registerCubit.confirmPasswordIcon,
                            size: 30,
                          ),
                        ),
                      ),
                      onTapOutside: (event) => FocusScope.of(context).unfocus(),
                      validator: (value) => value!.confirmPasswordValidation(
                        newPassController:
                            registerCubit.passwordController.text.trim(),
                      ),
                    ),
                  ),
                ),
                TextFormField(
                  controller: registerCubit.phoneController,
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
                      AlifIcons.phone_outline,
                      size: 30,
                    ),
                  ),
                  onTapOutside: (event) => FocusScope.of(context).unfocus(),
                  validator: (value) => value!.phoneValidation(),
                ),
                Padding(
                  padding: EdgeInsetsDirectional.only(
                    top: height * 0.0415,
                    bottom: height * 0.0315,
                  ),
                  child: CustomElevatedButton(
                    text: 'إنشاء حساب',
                    onTap: () =>
                        registerCubit.register(userCubit.updateCurrentUser),
                  ),
                ),
                Row(
                  children: [
                    Expanded(child: Divider(endIndent: width * 0.03)),
                    Text(
                      "أو",
                      style: Theme.of(context).textTheme.titleLarge!.copyWith(
                            color: AppColors.onSurfaceVariant,
                            fontWeight: FontWeight.w600,
                          ),
                    ),
                    Expanded(child: Divider(indent: width * 0.03)),
                  ],
                ),
                Padding(
                  padding:
                      EdgeInsetsDirectional.symmetric(vertical: height * 0.02),
                  child: Center(
                    child: OutlinedButton.icon(
                      onPressed: null,
                      icon: SvgPicture.asset(
                        "lib/assets/svg/google.svg",
                        width: 35,
                        height: 35,
                        fit: BoxFit.contain,
                      ),
                      label: Text(
                        "تسجيل عبر جوجل",
                        style:
                            Theme.of(context).textTheme.headlineSmall!.copyWith(
                                  color: AppColors.onSurface,
                                  fontWeight: FontWeight.w600,
                                ),
                      ),
                    ),
                  ),
                ),
                Center(
                  child: OutlinedButton.icon(
                    onPressed: null,
                    icon: SvgPicture.asset(
                      "lib/assets/svg/facebook.svg",
                      width: 35,
                      height: 35,
                      fit: BoxFit.contain,
                    ),
                    label: Text(
                      "تسجيل عبر فيسبوك",
                      style: Theme.of(context)
                          .textTheme
                          .headlineSmall!
                          .copyWith(
                              color: AppColors.onSurface,
                              fontWeight: FontWeight.w600),
                    ),
                  ),
                ),
                Padding(
                  padding:
                      EdgeInsetsDirectional.symmetric(vertical: height * 0.025),
                  child: Align(
                    alignment: Alignment.center,
                    child: TextButton(
                      onPressed: () =>
                          Navigator.of(context).pushReplacementNamed("/login"),
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            "لديك حساب؟ ",
                            style: Theme.of(context)
                                .textTheme
                                .titleLarge!
                                .copyWith(color: AppColors.onSurface),
                          ),
                          CustomGradientShader(
                            child: Text(
                              "أدخل الآن",
                              style: Theme.of(context)
                                  .textTheme
                                  .titleLarge!
                                  .copyWith(
                                    color: AppColors.onSecondary,
                                    fontWeight: FontWeight.w600,
                                  ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
