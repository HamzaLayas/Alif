import 'package:alif/presentation/widgets/custom_scaffold.dart';
import 'package:alif/utils/style/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class NotificationScreen extends StatelessWidget {
  const NotificationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;
    return CustomScaffold(
      title: "الإشـعـارات",
      child: Column(
        mainAxisSize: MainAxisSize.max,
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Spacer(flex: 10),
          Center(
            child: SvgPicture.asset(
              'lib/assets/svg/notification.svg',
              height: height * 0.25,
              fit: BoxFit.fitHeight,
            ),
          ),
          Spacer(),
          Text(
            'لا يوجد نتائج',
            style: Theme.of(context)
                .textTheme
                .headlineSmall!
                .copyWith(color: AppColors.onSurfaceVariant),
          ),
          Spacer(flex: 10),
        ],
      ),
    );
  }
}
