import 'package:alif/presentation/widgets/custom_auth_scaffold.dart';
import 'package:alif/presentation/widgets/custom_elevated_button.dart';
import 'package:alif/presentation/widgets/custom_gradient_shader.dart';
import 'package:alif/utils/constants/validation_extension.dart';
import 'package:alif/utils/style/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class RegisterScreen extends StatelessWidget {
  const RegisterScreen({super.key});

  static final formKey = GlobalKey();
  static final nameController = TextEditingController();
  static final emailController = TextEditingController();
  static final passwordController = TextEditingController();
  static final confirmPasswordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    bool isPasswordObscured = true;
    bool isConfirmObscured = true;
    return CustomAuthScaffold(
      child: SafeArea(
        left: false,
        right: false,
        child: Padding(
          padding: const EdgeInsetsDirectional.symmetric(horizontal: 20),
          child: Form(
            key: formKey,
            child: ListView(
              children: <Widget>[
                Padding(
                  padding: const EdgeInsetsDirectional.only(bottom: 20),
                  child: Text(
                    'إنشاء حساب',
                    style: Theme.of(context).textTheme.headlineLarge!.copyWith(
                        color: AppColors.secondary,
                        fontWeight: FontWeight.w600),
                  ),
                ),
                TextFormField(
                  controller: nameController,
                  enableSuggestions: true,
                  keyboardType: TextInputType.name,
                  textCapitalization: TextCapitalization.words,
                  style: Theme.of(context)
                      .textTheme
                      .titleLarge!
                      .copyWith(color: AppColors.secondary),
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
                  padding: const EdgeInsetsDirectional.symmetric(vertical: 20),
                  child: TextFormField(
                    controller: emailController,
                    enableSuggestions: true,
                    keyboardType: TextInputType.emailAddress,
                    style: Theme.of(context)
                        .textTheme
                        .titleLarge!
                        .copyWith(color: AppColors.secondary),
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
                StatefulBuilder(builder: (context, setState) {
                  return TextFormField(
                    controller: passwordController,
                    obscureText: isPasswordObscured,
                    keyboardType: TextInputType.none,
                    style: Theme.of(context)
                        .textTheme
                        .titleLarge!
                        .copyWith(color: AppColors.secondary),
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
                        onTap: () {
                          setState(
                            () => isPasswordObscured = !isPasswordObscured,
                          );
                        },
                        splashColor: AppColors.secondary,
                        borderRadius: BorderRadius.circular(50),
                        child: Icon(
                          isPasswordObscured
                              ? Icons.lock_outline_rounded
                              : Icons.lock_open_rounded,
                          size: 30,
                        ),
                      ),
                    ),
                    onTapOutside: (event) => FocusScope.of(context).unfocus(),
                    validator: (value) => value!.passwordValidation(),
                  );
                }),
                Padding(
                  padding: const EdgeInsetsDirectional.only(top: 20),
                  child: StatefulBuilder(builder: (context, setState) {
                    return TextFormField(
                      controller: confirmPasswordController,
                      obscureText: isConfirmObscured,
                      keyboardType: TextInputType.none,
                      style: Theme.of(context)
                          .textTheme
                          .titleLarge!
                          .copyWith(color: AppColors.secondary),
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
                          onTap: () {
                            setState(
                              () => isConfirmObscured = !isConfirmObscured,
                            );
                          },
                          splashColor: AppColors.secondary,
                          borderRadius: BorderRadius.circular(50),
                          child: Icon(
                            isConfirmObscured
                                ? Icons.lock_outline_rounded
                                : Icons.lock_open_rounded,
                            size: 30,
                          ),
                        ),
                      ),
                      onTapOutside: (event) => FocusScope.of(context).unfocus(),
                      validator: (value) => value!.passwordValidation(),
                    );
                  }),
                ),
                Padding(
                  padding:
                      const EdgeInsetsDirectional.only(top: 40, bottom: 30),
                  child: CustomElevatedButton(
                    text: 'إنشاء حساب',
                    onTap: () {},
                  ),
                ),
                Center(
                  child: Text(
                    "أو",
                    style: Theme.of(context).textTheme.titleLarge!.copyWith(
                          color: AppColors.onSurfaceVariant,
                          fontWeight: FontWeight.w600,
                        ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsetsDirectional.symmetric(vertical: 20),
                  child: Center(
                    child: OutlinedButton.icon(
                      onPressed: () {},
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
                                  color: AppColors.secondary,
                                  fontWeight: FontWeight.w600,
                                ),
                      ),
                    ),
                  ),
                ),
                Center(
                  child: OutlinedButton.icon(
                    onPressed: () {},
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
                              color: AppColors.secondary,
                              fontWeight: FontWeight.w600),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsetsDirectional.symmetric(vertical: 24),
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
                                .copyWith(color: AppColors.secondary),
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