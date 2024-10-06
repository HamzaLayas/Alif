import 'package:alif/presentation/auth/register/register_cubit/register_cubit.dart';
import 'package:alif/presentation/widgets/custom_auth_scaffold.dart';
import 'package:alif/presentation/widgets/custom_elevated_button.dart';
import 'package:alif/presentation/widgets/custom_gradient_shader.dart';
import 'package:alif/presentation/widgets/show_error.dart';
import 'package:alif/presentation/widgets/show_loading_dialog.dart';
import 'package:alif/utils/constants/validation_extension.dart';
import 'package:alif/utils/style/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';

class RegisterScreen extends StatelessWidget {
  const RegisterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => RegisterCubit(),
      child: RegisterScreenView(),
    );
  }
}

class RegisterScreenView extends StatelessWidget {
  const RegisterScreenView({super.key});

  @override
  Widget build(BuildContext context) {
    final cubit = context.read<RegisterCubit>();
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;
    return CustomAuthScaffold(
      child: SafeArea(
        left: false,
        right: false,
        child: Padding(
          padding: EdgeInsetsDirectional.symmetric(horizontal: width * 0.03),
          child: BlocListener<RegisterCubit, RegisterState>(
            listener: (context, state) {
              if (state is RegisterLoading) {
                showLoadingDialog(context);
                Future.delayed(Duration(seconds: 1));
              } else if (state is RegisterFailure) {
                Navigator.pop(context);
                showSnackBar(state.error, context);
              } else if (state is RegisterSuccess) {
                Navigator.pop(context);
                Navigator.pushReplacementNamed(context, "/main");
              }
            },
            child: Form(
              key: cubit.formKey,
              child: ListView(
                children: <Widget>[
                  Padding(
                    padding: EdgeInsetsDirectional.only(bottom: height * 0.02),
                    child: Text(
                      'إنشاء حساب',
                      style: Theme.of(context)
                          .textTheme
                          .headlineLarge!
                          .copyWith(
                              color: AppColors.onSurface,
                              fontWeight: FontWeight.w600),
                    ),
                  ),
                  TextFormField(
                    controller: cubit.nameController,
                    enableSuggestions: true,
                    keyboardType: TextInputType.name,
                    textCapitalization: TextCapitalization.words,
                    style: Theme.of(context)
                        .textTheme
                        .titleLarge!
                        .copyWith(color: AppColors.onSurface),
                    decoration: InputDecoration(
                      hintText: "الإسم",
                      hintStyle: Theme.of(context)
                          .textTheme
                          .titleLarge!
                          .copyWith(color: AppColors.onSurfaceVariant),
                      prefixIcon: const Icon(
                        Icons.person_2_outlined,
                        size: 30,
                      ),
                    ),
                    onTapOutside: (event) => FocusScope.of(context).unfocus(),
                    validator: (value) => value!.emptyFieldValidation(),
                  ),
                  Padding(
                    padding: EdgeInsetsDirectional.symmetric(
                        vertical: height * 0.02),
                    child: TextFormField(
                      controller: cubit.emailController,
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
                          Icons.email_outlined,
                          size: 30,
                        ),
                      ),
                      onTapOutside: (event) => FocusScope.of(context).unfocus(),
                      validator: (value) => value!.emailValidation(),
                    ),
                  ),
                  TextFormField(
                    controller: cubit.passwordController,
                    obscureText: cubit.isPasswordObscured,
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
                        Icons.password_rounded,
                        size: 30,
                      ),
                      suffixIcon: InkWell(
                        onTap: cubit.obscurePasswordToggle,
                        splashColor: AppColors.secondary,
                        borderRadius: BorderRadius.circular(50),
                        child: Icon(
                          cubit.isPasswordObscured
                              ? Icons.lock_outline_rounded
                              : Icons.lock_open_rounded,
                          size: 30,
                        ),
                      ),
                    ),
                    onTapOutside: (event) => FocusScope.of(context).unfocus(),
                    validator: (value) => value!.passwordValidation(),
                  ),
                  Padding(
                    padding: EdgeInsetsDirectional.symmetric(
                        vertical: height * 0.02),
                    child: BlocProvider(
                      create: (context) => RegisterCubit(),
                      child: TextFormField(
                        controller: cubit.confirmPasswordController,
                        obscureText: cubit.isConfirmObscured,
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
                            Icons.password_rounded,
                            size: 30,
                          ),
                          suffixIcon: InkWell(
                            onTap: cubit.obscureConfirmToggle,
                            splashColor: AppColors.secondary,
                            borderRadius: BorderRadius.circular(50),
                            child: Icon(
                              cubit.isConfirmObscured
                                  ? Icons.lock_outline_rounded
                                  : Icons.lock_open_rounded,
                              size: 30,
                            ),
                          ),
                        ),
                        onTapOutside: (event) =>
                            FocusScope.of(context).unfocus(),
                        validator: (value) => value!.confirmPasswordValidation(
                          newPassController:
                              cubit.passwordController.text.trim(),
                        ),
                      ),
                    ),
                  ),
                  TextFormField(
                    controller: cubit.phoneController,
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
                        Icons.phone_outlined,
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
                      onTap: () => cubit.register(),
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
                    padding: EdgeInsetsDirectional.symmetric(
                        vertical: height * 0.02),
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
                          style: Theme.of(context)
                              .textTheme
                              .headlineSmall!
                              .copyWith(
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
                    padding: EdgeInsetsDirectional.symmetric(
                        vertical: height * 0.025),
                    child: Align(
                      alignment: Alignment.center,
                      child: TextButton(
                        onPressed: () => Navigator.of(context)
                            .pushReplacementNamed("/login"),
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
      ),
    );
  }
}
