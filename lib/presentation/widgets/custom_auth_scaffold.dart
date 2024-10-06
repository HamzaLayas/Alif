import 'package:alif/presentation/widgets/custom_gradient_shader.dart';
import 'package:alif/utils/style/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class CustomAuthScaffold extends StatelessWidget {
  const CustomAuthScaffold({super.key, required this.child});
  final Widget child;

  @override
  Widget build(BuildContext context) {
    final paddingTop = MediaQuery.of(context).viewPadding.top;
    final height = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: AppColors.secondary,
      resizeToAvoidBottomInset: false,
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(height * 0.125),
        child: Container(
          margin: EdgeInsetsDirectional.only(top: paddingTop),
          alignment: AlignmentDirectional.center,
          child: CustomGradientShader(
            child: RichText(
                text: TextSpan(
              children: [
                WidgetSpan(
                  child: SvgPicture.asset(
                    "lib/assets/svg/alf.svg",
                    fit: BoxFit.fitHeight,
                    height: height * 0.1125,
                  ),
                ),
                TextSpan(
                  text: 'لِفْ',
                  style: Theme.of(context).textTheme.displayLarge!.copyWith(
                        fontSize: height * 0.1,
                        fontFamily: "Lalezra",
                        fontWeight: FontWeight.bold,
                        color: AppColors.surface,
                      ),
                ),
              ],
            )),
          ),
        ),
      ),
      body: child,
    );
  }
}
