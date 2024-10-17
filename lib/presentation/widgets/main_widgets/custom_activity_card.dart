import 'package:alif/presentation/widgets/custom_gradient_shader.dart';
import 'package:alif/utils/style/alif_icons.dart';
import 'package:alif/utils/style/colors.dart';
import 'package:flutter/material.dart';

class CustomActivityCard extends StatelessWidget {
  const CustomActivityCard({super.key});

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    // final height = MediaQuery.of(context).size.height;
    return AspectRatio(
      aspectRatio: 330 / 120,
      child: Card(
        child: InkWell(
          borderRadius: BorderRadius.circular(18),
          onTap: () {},
          child: Padding(
            padding: EdgeInsetsDirectional.all(width * 0.02),
            child: Row(
              mainAxisSize: MainAxisSize.max,
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                AspectRatio(
                  aspectRatio: 80 / 95,
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(18),
                    child: Image.asset(
                      'lib/assets/images/fare.jpg',
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                Spacer(),
                Column(
                  mainAxisSize: MainAxisSize.max,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Spacer(flex: 1),
                    Text(
                      'من يوم 15/10/2024 إلي 20/10/2024',
                      style: Theme.of(context)
                          .textTheme
                          .titleMedium!
                          .copyWith(color: AppColors.onPrimary),
                    ),
                    Spacer(flex: 2),
                    Text(
                      'كورس بطاطة شكرا',
                      maxLines: 2,
                      style: Theme.of(context).textTheme.titleLarge!.copyWith(
                            color: AppColors.onSurface,
                            fontWeight: FontWeight.w600,
                          ),
                    ),
                    Text(
                      'شركة بطاطة التعليمية',
                      maxLines: 2,
                      style: Theme.of(context).textTheme.titleMedium!.copyWith(
                            color: AppColors.onSurface,
                            fontWeight: FontWeight.w600,
                          ),
                    ),
                    Spacer(flex: 3),
                    RichText(
                      text: TextSpan(
                        children: [
                          WidgetSpan(
                            child: Icon(
                              AlifIcons.location,
                              size: 15,
                              color: AppColors.onSurface,
                            ),
                          ),
                          TextSpan(
                            text: 'سوق الجمعة جنب جامع السوالم',
                            style: Theme.of(context)
                                .textTheme
                                .titleMedium!
                                .copyWith(color: AppColors.onSurface),
                          ),
                        ],
                      ),
                    ),
                    Spacer(flex: 1),
                  ],
                ),
                Spacer(),
                InkWell(
                  onTap: () {},
                  borderRadius: BorderRadius.circular(50),
                  child: CustomGradientShader(
                    child: Icon(AlifIcons.saved_outlined, size: 25),
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
