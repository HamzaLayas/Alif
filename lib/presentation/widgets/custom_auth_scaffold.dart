import 'package:alif/presentation/widgets/custom_gradient_shader.dart';
import 'package:alif/utils/style/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class CustomAuthScaffold extends StatelessWidget {
  const CustomAuthScaffold({super.key, required this.child});
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 250, 250, 250),
      appBar: AppBar(
        surfaceTintColor: AppColors.transparent,
        bottom: PreferredSize(
          preferredSize: const Size.fromHeight(110),
          child: CustomGradientShader(
            child: RichText(
                text: TextSpan(
              children: [
                WidgetSpan(
                  child: SvgPicture.asset(
                    "lib/assets/svg/alf.svg",
                    width: 125,
                    height: 125,
                  ),
                ),
                TextSpan(
                  text: 'لِفْ',
                  style: Theme.of(context).textTheme.displayLarge!.copyWith(
                        fontSize: 125,
                        fontFamily: "Lalezra",
                        fontWeight: FontWeight.bold,
                        color: AppColors.onSecondary,
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
