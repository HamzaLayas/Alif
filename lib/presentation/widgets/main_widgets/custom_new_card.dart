import 'package:alif/utils/style/alif_icons.dart';
import 'package:alif/utils/style/colors.dart';
import 'package:flutter/material.dart';

class CustomNewCard extends StatelessWidget {
  const CustomNewCard({super.key});

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;
    return AspectRatio(
      aspectRatio: 335 / 200,
      child: Stack(
        children: [
          Card(
            elevation: 0,
            borderOnForeground: true,
            surfaceTintColor: AppColors.transparent,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(18),
              side: BorderSide(width: 0.5, color: AppColors.onSecondary),
            ),
            child: InkWell(
              onTap: () {},
              borderRadius: BorderRadius.circular(18),
              child: Padding(
                padding: const EdgeInsets.all(5.0),
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Expanded(
                      flex: 15,
                      child: Container(
                        margin: EdgeInsetsDirectional.all(width * 0.015),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadiusDirectional.only(
                            topEnd: Radius.circular(10),
                            topStart: Radius.circular(10),
                          ),
                          // image: DecorationImage(
                          //   image: AssetImage('lib/assets/images/profile.jpg'),
                          //   fit: BoxFit.fitWidth,
                          // ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsetsDirectional.symmetric(
                        horizontal: width * 0.015,
                      ),
                      child: Row(
                        mainAxisSize: MainAxisSize.max,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Column(
                            children: [
                              Text(
                                'كورس بطاطا شكرا',
                                style: Theme.of(context)
                                    .textTheme
                                    .titleLarge!
                                    .copyWith(
                                      color: AppColors.onSurface,
                                      fontWeight: FontWeight.w600,
                                    ),
                              ),
                              Text(
                                'كورس بطاطا شكرا',
                                style: Theme.of(context)
                                    .textTheme
                                    .titleLarge!
                                    .copyWith(color: AppColors.onSurface),
                              ),
                            ],
                          ),
                          SizedBox(
                            width: width * 0.25,
                            height: height * 0.05,
                            child: OutlinedButton(
                              onPressed: null,
                              style: OutlinedButton.styleFrom(
                                backgroundColor: AppColors.transparent,
                              ),
                              child: Text(
                                'data',
                                style: Theme.of(context)
                                    .textTheme
                                    .titleLarge!
                                    .copyWith(
                                      color: AppColors.onPrimary,
                                    ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Spacer(flex: 1),
                  ],
                ),
              ),
            ),
          ),
          ConstrainedBox(
            constraints: BoxConstraints.expand(),
            child: Padding(
              padding: EdgeInsetsDirectional.only(
                  top: width * 0.05, end: width * 0.05),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    width: width * 0.2,
                    height: height * 0.040,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadiusDirectional.only(
                        bottomEnd: Radius.circular(10),
                        topEnd: Radius.circular(10),
                      ),
                      color: AppColors.primary,
                    ),
                    child: Center(
                      child: Text(
                        'تعليمي',
                        style:
                            Theme.of(context).textTheme.titleMedium!.copyWith(
                                  color: AppColors.surface,
                                  fontWeight: FontWeight.w600,
                                ),
                      ),
                    ),
                  ),
                  Container(
                    width: height * 0.040,
                    height: height * 0.040,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: AppColors.surface.withOpacity(0.85),
                    ),
                    child: IconButton(
                      onPressed: () {},
                      icon: Icon(
                        AlifIcons.saved_outlined,
                        size: 25,
                        color: AppColors.onPrimary,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
