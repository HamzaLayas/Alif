import 'dart:ui';

import 'package:alif/utils/style/alif_icons.dart';
import 'package:alif/utils/style/colors.dart';
import 'package:flutter/material.dart';

class CustomFeaturedBanner extends StatelessWidget {
  const CustomFeaturedBanner({super.key});

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;
    return Container(
      height: height * 0.225,
      padding: EdgeInsetsDirectional.all(width * 0.0225),
      margin: EdgeInsetsDirectional.symmetric(horizontal: width * 0.03),
      decoration: BoxDecoration(
        color: AppColors.surface,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(width: 0.5, color: AppColors.onSecondary),
        // image: DecorationImage(
        //   image: AssetImage('lib/assets/images/profile.jpg'),
        //   alignment: AlignmentDirectional.center,
        //   fit: BoxFit.cover,
        // ),
      ),
      child: Container(
        alignment: AlignmentDirectional.bottomCenter,
        child: AspectRatio(
          aspectRatio: 325 / 90,
          child: Container(
            decoration: BoxDecoration(
              color: AppColors.onSurface.withOpacity(0.3),
              borderRadius: BorderRadius.circular(12),
            ),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(12),
              child: BackdropFilter(
                filter: ImageFilter.blur(sigmaX: 7.5, sigmaY: 7.5),
                child: Padding(
                  padding: EdgeInsetsDirectional.symmetric(horizontal: width * 0.025),
                  child: Row(
                    children: [
                      Expanded(
                        flex: 3,
                        child: Column(
                          mainAxisSize: MainAxisSize.max,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              'تعليمي: كورس بطاطا شكرا',
                              style: Theme.of(context)
                                  .textTheme
                                  .titleLarge!
                                  .copyWith(
                                    color: AppColors.surface,
                                    fontWeight: FontWeight.w600,
                                  ),
                            ),
                            RichText(
                              text: TextSpan(
                                children: [
                                  WidgetSpan(
                                    child: Icon(
                                      AlifIcons.location,
                                      size: 15,
                                      color: AppColors.surface,
                                    ),
                                  ),
                                  TextSpan(
                                    text: 'سوق الجمعة جنب جامع السوالم',
                                    style: Theme.of(context)
                                        .textTheme
                                        .titleMedium!
                                        .copyWith(color: AppColors.surface),
                                  ),
                                ],
                              ),
                            ),
                            RichText(
                              text: TextSpan(
                                children: [
                                  WidgetSpan(
                                    child: Icon(
                                      AlifIcons.calender,
                                      size: 15,
                                      color: AppColors.surface,
                                    ),
                                  ),
                                  TextSpan(
                                    text: 'من يوم 15/10/2024 إلي 20/10/2024',
                                    style: Theme.of(context)
                                        .textTheme
                                        .titleMedium!
                                        .copyWith(color: AppColors.surface),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                      Expanded(
                        flex: 1,
                        child: Column(
                          mainAxisSize: MainAxisSize.max,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              'أحجز الأن!',
                              style: Theme.of(context)
                                  .textTheme
                                  .titleLarge!
                                  .copyWith(
                                    color: AppColors.surface,
                                    fontWeight: FontWeight.w600,
                                  ),
                            ),
                            Text(
                              '50 دينار',
                              style: Theme.of(context)
                                  .textTheme
                                  .titleMedium!
                                  .copyWith(color: AppColors.surface),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
