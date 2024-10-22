import 'package:alif/presentation/home/pages/tickets_page/tickets_cubit/tickets_cubit.dart';
import 'package:alif/presentation/widgets/main_widgets/custom_appbar.dart';
import 'package:alif/utils/style/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';

class TicketsPage extends StatelessWidget {
  const TicketsPage({super.key});

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;
    return BlocProvider(
      create: (context) => TicketsCubit(),
      child: Scaffold(
        extendBodyBehindAppBar: true,
        backgroundColor: AppColors.secondary,
        appBar: CustomeAppBar(
          height: height,
          child: Padding(
            padding: EdgeInsetsDirectional.symmetric(vertical: width * 0.015),
            child: Row(
              children: [
                Expanded(
                  child: ElevatedButton(
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(
                        backgroundColor: AppColors.transparent),
                    child: Text(
                      'الحجوزات السابقة',
                      style:
                          Theme.of(context).textTheme.headlineSmall!.copyWith(
                                color: AppColors.surface,
                                fontWeight: FontWeight.w600,
                              ),
                    ),
                  ),
                ),
                Expanded(
                  child: ElevatedButton(
                    onPressed: () {},
                    child: Text(
                      'الحجوزات القادمة',
                      style:
                          Theme.of(context).textTheme.headlineSmall!.copyWith(
                                color: AppColors.onPrimary,
                                fontWeight: FontWeight.w600,
                              ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
        body: SafeArea(
          child: Column(
            mainAxisSize: MainAxisSize.max,
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Spacer(flex: 10),
              Center(
                child: SvgPicture.asset(
                  'lib/assets/svg/activity.svg',
                  height: height * 0.25,
                  fit: BoxFit.fitHeight,
                ),
              ),
              Spacer(),
              Text(
                'لا يـوجـد نـتـائـج',
                style: Theme.of(context)
                    .textTheme
                    .headlineSmall!
                    .copyWith(color: AppColors.onSurfaceVariant),
              ),
              Spacer(flex: 10),
            ],
          ),
        ),
      ),
    );
  }
}
