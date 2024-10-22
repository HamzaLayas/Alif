import 'package:alif/presentation/home/pages/saved_page/saved_cubit/saved_cubit.dart';
import 'package:alif/presentation/widgets/main_widgets/custom_activity_card.dart';
import 'package:alif/presentation/widgets/main_widgets/custom_appbar.dart';
import 'package:alif/utils/style/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:skeletonizer/skeletonizer.dart';

class SavedPage extends StatelessWidget {
  const SavedPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => SavedCubit(),
      child: SavedPageView(),
    );
  }
}

class SavedPageView extends StatelessWidget {
  const SavedPageView({super.key});

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;
    final savedCubit = context.read<SavedCubit>();
    return Scaffold(
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
                    'الـشـركـات',
                    style: Theme.of(context).textTheme.headlineSmall!.copyWith(
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
                    'الأنـشـطـة',
                    style: Theme.of(context).textTheme.headlineSmall!.copyWith(
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
      body: BlocBuilder<SavedCubit, SavedState>(
        builder: (context, state) {
          return state is SavedEmpty
              ? SafeArea(
                child: Column(
                    mainAxisSize: MainAxisSize.max,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Spacer(flex: 10),
                      Center(
                        child: SvgPicture.asset(
                          'lib/assets/svg/saved.svg',
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
              )
              : Skeletonizer(
                  enabled: state is SavedInitial,
                  child: Padding(
                    padding: EdgeInsetsDirectional.symmetric(
                        horizontal: width * 0.03),
                    child: ListView.builder(
                      itemCount:
                          state is SavedInitial ? 3 : savedCubit.saved.length,
                      itemBuilder: (context, index) => CustomActivityCard(),
                    ),
                  ),
                );
        },
      ),
    );
  }
}
