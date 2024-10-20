import 'package:alif/presentation/widgets/custom_gradient_shader.dart';
import 'package:alif/utils/style/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';

Future<void> showLoadingDialog(BuildContext context) async {
  return showDialog(
    context: context,
    barrierDismissible: false,
    builder: (BuildContext context) {
      final height = MediaQuery.of(context).size.height;
      return PopScope(
        canPop: true,
        child: AlertDialog(
          surfaceTintColor: Colors.transparent,
          backgroundColor: Colors.transparent,
          content: Column(
            mainAxisSize: MainAxisSize.max,
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Spacer(flex: 10),
              CustomGradientShader(
                child: SvgPicture.asset(
                  "lib/assets/svg/alf.svg",
                  fit: BoxFit.fitHeight,
                  height: height * 0.15,
                ),
              ),
              const Spacer(flex: 1),
              SizedBox(
                height: height * 0.125,
                child: CustomGradientShader(
                  child: LoadingAnimationWidget.staggeredDotsWave(
                    color: AppColors.onSecondary,
                    size: height * 0.1,
                  ),
                ),
              ),
              const Spacer(flex: 10),
            ],
          ),
        ),
      );
    },
  );
}
