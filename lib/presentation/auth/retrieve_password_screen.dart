import 'package:alif/presentation/widgets/custom_elevated_button.dart';
import 'package:alif/presentation/widgets/custom_gradient_shader.dart';
import 'package:alif/utils/constants/validation_extension.dart';
import 'package:alif/utils/style/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class RetrievePasswordScreen extends StatelessWidget {
  const RetrievePasswordScreen({super.key});

  static final formKey = GlobalKey();
  static final nameController = TextEditingController();
  static final emailController = TextEditingController();
  static final passwordController = TextEditingController();
  static final confirmPasswordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.surface,
      appBar: AppBar(
        leading: const BackButton(
          color: AppColors.secondary,
        ),
      ),
      body: SafeArea(
        left: false,
        right: false,
        child: Padding(
          padding: const EdgeInsetsDirectional.symmetric(horizontal: 20),
          child: Form(
            key: formKey,
            child: ListView(
              children: <Widget>[
                CustomGradientShader(
                  child: Text(
                    'إستعادة كلمة المرور',
                    style: Theme.of(context).textTheme.headlineLarge!.copyWith(
                        color: AppColors.onSecondary,
                        fontWeight: FontWeight.w600),
                  ),
                ),
                Padding(
                  padding:
                      const EdgeInsetsDirectional.only(top: 10, bottom: 20),
                  child: Text(
                    "أدخل بريدك الإلكتروني لطلب إستعادة كلمة المرور",
                    style: Theme.of(context).textTheme.titleLarge!.copyWith(
                        color: AppColors.secondary,
                        fontWeight: FontWeight.w600),
                  ),
                ),
                SvgPicture.asset(
                  "lib/assets/svg/forgot_password.svg",
                  height: 250,
                ),
                Padding(
                  padding:
                      const EdgeInsetsDirectional.only(top: 15, bottom: 30),
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
                CustomElevatedButton(
                  text: "إرسال",
                  onTap: () {},
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
