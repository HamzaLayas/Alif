import 'dart:ui';

import 'package:alif/data/models/service_model.dart';
import 'package:alif/utils/constants/api_constants.dart';
import 'package:alif/utils/style/alif_icons.dart';
import 'package:alif/utils/style/colors.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class CustomFeaturedBanner extends StatelessWidget {
  const CustomFeaturedBanner({super.key, required this.service});
  final ServiceModel? service;

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;
    final DateFormat formatter = DateFormat('yyyy/MM/dd');
    return Container(
      height: height * 0.225,
      padding: EdgeInsetsDirectional.all(width * 0.0225),
      margin: EdgeInsetsDirectional.symmetric(horizontal: width * 0.03),
      decoration: BoxDecoration(
        color: Colors.blueGrey.shade50,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(width: 0.5, color: AppColors.onSecondary),
        image: service == null
            ? null
            : DecorationImage(
                image: CachedNetworkImageProvider(
                    ApiConstants.getImagePath(service!.mainImage!)),
                alignment: AlignmentDirectional.center,
                fit: BoxFit.cover,
              ),
      ),
      child: InkWell(
        onTap: () {},
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
                    padding: EdgeInsetsDirectional.symmetric(
                        horizontal: width * 0.025),
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
                                '${service?.serviceCategories?.name ?? 'الفئة'}: ${service?.name ?? 'كورس بطاطة شكرا'}',
                                style: Theme.of(context)
                                    .textTheme
                                    .titleLarge!
                                    .copyWith(
                                      color: AppColors.surface,
                                      fontWeight: FontWeight.w600,
                                    ),
                              ),
                              Row(
                                children: [
                                  Icon(
                                    AlifIcons.location,
                                    size: 15,
                                    color: AppColors.surface,
                                  ),
                                  Text(
                                    service?.address ??
                                        'سوق الجمعة جنب جامع السوالم',
                                    style: Theme.of(context)
                                        .textTheme
                                        .titleMedium!
                                        .copyWith(color: AppColors.surface),
                                  ),
                                ],
                              ),
                              Row(
                                children: [
                                  Icon(
                                    AlifIcons.calender,
                                    size: 15,
                                    color: AppColors.surface,
                                  ),
                                  Text(
                                    service != null
                                        ? 'من يوم ${formatter.format(service!.serviceDate!.first.date!)} إلي ${formatter.format(service!.serviceDate!.last.date!)}'
                                        : 'إبتداءا من يوم 0000/00/00 ',
                                    style: Theme.of(context)
                                        .textTheme
                                        .titleMedium!
                                        .copyWith(color: AppColors.surface),
                                  ),
                                ],
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
                                '${service?.price ?? 000} دينار',
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
      ),
    );
  }
}
