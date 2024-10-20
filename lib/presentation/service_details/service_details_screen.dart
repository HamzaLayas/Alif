import 'package:alif/data/models/service_model.dart';
import 'package:alif/presentation/widgets/auth_widgets/custom_elevated_button.dart';
import 'package:alif/presentation/widgets/detail_widgets/custom_details_list_tile.dart';
import 'package:alif/presentation/widgets/main_widgets/custom_saved_button.dart';
import 'package:alif/utils/constants/api_constants.dart';
import 'package:alif/utils/style/alif_icons.dart';
import 'package:alif/utils/style/colors.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class ServiceDetailsScreen extends StatelessWidget {
  const ServiceDetailsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final ServiceModel service =
        ModalRoute.of(context)!.settings.arguments as ServiceModel;
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;
    final DateFormat formatter = DateFormat('yyyy/MM/dd');
    return Scaffold(
      backgroundColor: AppColors.secondary,
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        elevation: 0,
        scrolledUnderElevation: 0,
        backgroundColor: AppColors.transparent,
        iconTheme: IconThemeData(color: AppColors.surface),
        actions: [
          Padding(
            padding: EdgeInsetsDirectional.only(end: width * 0.03),
            child: CustomSavedButton(),
          ),
        ],
      ),
      bottomNavigationBar: Padding(
        padding: EdgeInsetsDirectional.symmetric(horizontal: width * 0.03)
            .copyWith(bottom: width * 0.03),
        child: CustomElevatedButton(
          text: 'إحجز الأن - ${service.price ?? 0} دينار',
          onTap: () {},
        ),
      ),
      body: Column(
        mainAxisSize: MainAxisSize.max,
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Hero(
            tag: service.sId ?? '',
            child: CachedNetworkImage(
              imageUrl: ApiConstants.getImagePath(service.mainImage!),
              height: height * 0.35,
              width: double.infinity,
              fit: BoxFit.fitWidth,
              alignment: Alignment.center,
            ),
          ),
          Spacer(flex: 1),
          Padding(
            padding: EdgeInsetsDirectional.symmetric(horizontal: width * 0.03),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text(
                  service.name!,
                  style: Theme.of(context)
                      .textTheme
                      .displaySmall!
                      .copyWith(fontWeight: FontWeight.w600),
                ),
              ],
            ),
          ),
          Padding(
            padding: EdgeInsetsDirectional.symmetric(horizontal: width * 0.03),
            child: Text(
              service.companyInfo ?? 'أسم الشركة',
              style: Theme.of(context)
                  .textTheme
                  .headlineMedium!
                  .copyWith(fontWeight: FontWeight.w600),
            ),
          ),
          Spacer(flex: 2),
          Padding(
            padding: EdgeInsetsDirectional.symmetric(horizontal: width * 0.03),
            child: Text(
              'تـفـاصـيـل الـنـشــاط',
              style: Theme.of(context)
                  .textTheme
                  .titleLarge!
                  .copyWith(fontWeight: FontWeight.w600),
            ),
          ),
          Spacer(flex: 1),
          Padding(
            padding: EdgeInsetsDirectional.symmetric(horizontal: width * 0.03),
            child: Row(
              mainAxisSize: MainAxisSize.max,
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  flex: 3,
                  child: CustomDetailsListTile(
                    icon: AlifIcons.location,
                    title: 'العـنـوان',
                    subTitle: service.address!,
                  ),
                ),
                Expanded(
                  flex: 2,
                  child: CustomDetailsListTile(
                    icon: AlifIcons.star_empty,
                    title: 'التـقـيـم',
                    subTitle: '4.3',
                  ),
                ),
              ],
            ),
          ),
          Spacer(flex: 1),
          Padding(
            padding: EdgeInsetsDirectional.symmetric(horizontal: width * 0.03),
            child: Row(
              mainAxisSize: MainAxisSize.max,
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  flex: 3,
                  child: CustomDetailsListTile(
                    icon: AlifIcons.calender,
                    title: 'المـدة',
                    subTitle:
                        '${formatter.format(service.serviceDate!.first.date!)} - ${formatter.format(service.serviceDate!.last.date!)}',
                  ),
                ),
                Expanded(
                  flex: 2,
                  child: CustomDetailsListTile(
                    icon: Icons.access_time_outlined,
                    title: 'الوقـت',
                    subTitle: '09:00 - 12:00',
                  ),
                ),
              ],
            ),
          ),
          Spacer(flex: 1),
          Padding(
            padding: EdgeInsetsDirectional.symmetric(horizontal: width * 0.03),
            child: CustomDetailsListTile(
              icon: AlifIcons.kids,
              title: 'العـمـر',
              subTitle: '12-7 سنة',
            ),
          ),
          Spacer(flex: 2),
          Padding(
            padding: EdgeInsetsDirectional.symmetric(horizontal: width * 0.03),
            child: Text(
              'حـول الـنـشــاط',
              style: Theme.of(context)
                  .textTheme
                  .titleLarge!
                  .copyWith(fontWeight: FontWeight.w600),
            ),
          ),
          Spacer(flex: 1),
          Padding(
            padding: EdgeInsetsDirectional.symmetric(horizontal: width * 0.03),
            child: Text(
              service.desription ?? 'لا يوجد',
              maxLines: 5,
              style: Theme.of(context)
                  .textTheme
                  .titleMedium!
                  .copyWith(fontWeight: FontWeight.w500),
            ),
          ),
          Spacer(flex: 10),
        ],
      ),
    );
  }
}
