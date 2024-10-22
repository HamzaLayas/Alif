import 'package:alif/data/models/service_type_model.dart';
import 'package:alif/presentation/widgets/custom_scaffold.dart';
import 'package:alif/presentation/widgets/main_widgets/custom_activity_card.dart';
import 'package:alif/presentation/widgets/search/custom_search_bottom_sheet.dart';
import 'package:alif/utils/style/alif_icons.dart';
import 'package:alif/utils/style/colors.dart';
import 'package:alif/utils/style/theme.dart';
import 'package:flutter/material.dart';

class TypeScreen extends StatelessWidget {
  const TypeScreen({super.key});

  void _openBottomSheet(BuildContext context) {
    final ServiceTypeModel type =
        ModalRoute.of(context)!.settings.arguments as ServiceTypeModel;
    showModalBottomSheet(
      context: context,
      backgroundColor: AppColors.secondary,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadiusDirectional.only(
          topEnd: Radius.circular(38),
          topStart: Radius.circular(38),
        ),
      ),
      builder: (BuildContext context) {
        return CustomSearchBottomSheet();
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    final ServiceTypeModel type =
        ModalRoute.of(context)!.settings.arguments as ServiceTypeModel;
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;
    return CustomScaffold(
      title: type.name ?? 'الفـئـة',
      paddingBottom: height * 0.085,
      appBarBottomRadius: 38,
      bottom: PreferredSize(
        preferredSize: Size.fromHeight(height * 0.085),
        child: Container(
          width: double.infinity,
          height: height * 0.060,
          margin: EdgeInsetsDirectional.symmetric(horizontal: width * 0.05)
              .copyWith(bottom: height * 0.0125),
          padding: EdgeInsetsDirectional.symmetric(horizontal: width * 0.015),
          decoration: BoxDecoration(
            color: AppColors.surface.withOpacity(0.35),
            borderRadius: BorderRadius.circular(100),
          ),
          child: TextField(
            onTapOutside: (event) => FocusScope.of(context).unfocus(),
            cursorColor: AppColors.surface,
            textAlignVertical: TextAlignVertical.center,
            style: Theme.of(context)
                .textTheme
                .titleLarge!
                .copyWith(color: AppColors.surface),
            decoration: searchInputDecoration.copyWith(
              suffixIcon: InkWell(
                onTap: () => _openBottomSheet(context),
                borderRadius: BorderRadius.circular(50),
                child: Icon(
                  AlifIcons.filter,
                  size: 40,
                  color: AppColors.surface,
                ),
              ),
              prefixIconConstraints: BoxConstraints(
                minHeight: height * 0.060,
                minWidth: height * 0.040,
              ),
              hintStyle: Theme.of(context)
                  .textTheme
                  .titleLarge!
                  .copyWith(color: AppColors.surface),
            ),
          ),
        ),
      ),
      child: Padding(
        padding: EdgeInsetsDirectional.symmetric(horizontal: width * 0.03),
        child: ListView.builder(
          itemCount: 7,
          itemBuilder: (context, index) => CustomActivityCard(),
        ),
      ),
      // Column(
      //   mainAxisSize: MainAxisSize.max,
      //   crossAxisAlignment: CrossAxisAlignment.center,
      //   mainAxisAlignment: MainAxisAlignment.center,
      //   children: [
      //     Spacer(flex: 10),
      //     Center(
      //       child: SvgPicture.asset(
      //         'lib/assets/svg/search.svg',
      //         height: height * 0.25,
      //         fit: BoxFit.fitHeight,
      //       ),
      //     ),
      //     Spacer(),
      //     Text(
      //         'لا يـوجـد نـتـائـج',
      //       style: Theme.of(context)
      //           .textTheme
      //           .headlineSmall!
      //           .copyWith(color: AppColors.onSurfaceVariant),
      //     ),
      //     Spacer(flex: 10),
      //   ],
      // ),
    );
  }
}
