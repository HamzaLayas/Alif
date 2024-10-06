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
      resizeToAvoidBottomInset: false,
      backgroundColor: AppColors.secondary,
      appBar: AppBar(
        backgroundColor: AppColors.transparent,
        leading: const BackButton(
          color: AppColors.onSurface,
        ),
      ),
      body: SafeArea(
        left: false,
        right: false,
        child: Padding(
          padding: const EdgeInsetsDirectional.symmetric(horizontal: 20),
          child: Form(
            key: formKey,
            child: Column(
              mainAxisSize: MainAxisSize.max,
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                CustomGradientShader(
                  child: Text(
                    'إستعادة كلمة المرور',
                    style: Theme.of(context).textTheme.headlineLarge!.copyWith(
                        color: AppColors.onSecondary,
                        fontWeight: FontWeight.w600),
                  ),
                ),
                const Spacer(flex: 1),
                Text(
                  "أدخل بريدك الإلكتروني لطلب إستعادة كلمة المرور",
                  style: Theme.of(context).textTheme.titleLarge!.copyWith(
                      color: AppColors.onSurface, fontWeight: FontWeight.w600),
                ),
                const Spacer(flex: 2),
                Align(
                  alignment: AlignmentDirectional.center,
                  child: SvgPicture.asset(
                    "lib/assets/svg/forgot_password.svg",
                    height: 250,
                  ),
                ),
                const Spacer(flex: 1),
                TextFormField(
                  controller: emailController,
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
                const Spacer(flex: 5),
                CustomElevatedButton(
                  text: "إرسال",
                  onTap: () {},
                ),
                const Spacer(flex: 50),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
