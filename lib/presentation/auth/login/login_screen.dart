import 'package:alif/presentation/auth/login/login_cubit/login_cubit.dart';
import 'package:alif/presentation/widgets/custom_auth_scaffold.dart';
import 'package:alif/presentation/widgets/custom_elevated_button.dart';
import 'package:alif/presentation/widgets/custom_gradient_shader.dart';
import 'package:alif/presentation/widgets/show_error.dart';
import 'package:alif/presentation/widgets/show_loading_dialog.dart';
import 'package:alif/utils/constants/validation_extension.dart';
import 'package:alif/utils/style/alif_icons.dart';
import 'package:alif/utils/style/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => LoginCubit(),
      child: const LoginScreenView(),
    );
  }
}

class LoginScreenView extends StatelessWidget {
  const LoginScreenView({super.key});

  @override
  Widget build(BuildContext context) {
    final cubit = context.read<LoginCubit>();
    final width = MediaQuery.of(context).size.width;
    // final height = MediaQuery.of(context).size.height;
    return CustomAuthScaffold(
      child: SafeArea(
        left: false,
        right: false,
        child: Padding(
          padding: EdgeInsetsDirectional.symmetric(horizontal: width * 0.03),
          child: BlocListener<LoginCubit, LoginState>(
            listener: (context, state) {
              if (state is LoginLoading) {
                showLoadingDialog(context);
              }
              if (state is LoginFailure) {
                Navigator.pop(context);
                showSnackBar(state.error, context);
              }
              if (state is LoginSuccess) {
                Navigator.pop(context);
                Navigator.pushReplacementNamed(context, "/main");
              }
            },
            child: Form(
              key: cubit.formKey,
              child: Column(
                mainAxisSize: MainAxisSize.max,
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: <Widget>[
                  const Spacer(flex: 1),
                  Text(
                    'تسجيل الدخول',
                    style: Theme.of(context).textTheme.headlineLarge!.copyWith(
                          color: AppColors.onSurface,
                          fontWeight: FontWeight.w600,
                        ),
                  ),
                  const Spacer(flex: 2),
                  TextFormField(
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
                        AlifIcons.mail,
                        size: 30,
                      ),
                    ),
                    onTapOutside: (event) => FocusScope.of(context).unfocus(),
                    validator: (value) => value!.emailValidation(),
                  ),
                  const Spacer(flex: 2),
                  BlocBuilder<LoginCubit, LoginState>(
                    builder: (context, state) {
                      return TextFormField(
                        controller: cubit.passwordController,
                        obscureText: cubit.isObscured,
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
                          prefixIcon:
                              const Icon(AlifIcons.password, size: 30),
                          suffixIcon: InkWell(
                            onTap: () => cubit.obscureToggle(),
                            splashColor: AppColors.secondary,
                            borderRadius: BorderRadius.circular(50),
                            child: Icon(cubit.passwordIcon, size: 30),
                          ),
                        ),
                        onTapOutside: (event) =>
                            FocusScope.of(context).unfocus(),
                        validator: (value) => value!.passwordValidation(),
                      );
                    },
                  ),
                  const Spacer(flex: 2),
                  TextButton(
                    onPressed: () =>
                        Navigator.of(context).pushNamed("/retrieve"),
                    child: Text(
                      "نسيت كلمة المرور؟",
                      style: Theme.of(context)
                          .textTheme
                          .titleLarge!
                          .copyWith(color: AppColors.onSurface),
                    ),
                  ),
                  const Spacer(flex: 6),
                  CustomElevatedButton(
                    text: 'تسجيل الدخول',
                    onTap: () => cubit.login(),
                  ),
                  const Spacer(flex: 3),
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
                  const Spacer(flex: 3),
                  OutlinedButton.icon(
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
                  const Spacer(flex: 2),
                  OutlinedButton.icon(
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
                  const Spacer(flex: 3),
                  Align(
                    alignment: Alignment.center,
                    child: TextButton(
                      onPressed: () => Navigator.of(context)
                          .pushReplacementNamed("/register"),
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            "ليس لديك حساب؟ ",
                            style: Theme.of(context)
                                .textTheme
                                .titleLarge!
                                .copyWith(color: AppColors.onSurface),
                          ),
                          CustomGradientShader(
                            child: Text(
                              "إنشاء حساب.",
                              style: Theme.of(context)
                                  .textTheme
                                  .titleLarge!
                                  .copyWith(
                                    color: AppColors.surface,
                                    fontWeight: FontWeight.w600,
                                  ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  const Spacer(flex: 3),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
