import 'package:alif/presentation/home/pages/explore_page/explore_cubit/explore_cubit.dart';
import 'package:alif/presentation/widgets/main_widgets/custom_appbar.dart';
import 'package:alif/presentation/widgets/main_widgets/custom_category_card.dart';
import 'package:alif/utils/cubits/user_cubit/user_cubit.dart';
import 'package:alif/utils/style/colors.dart';
import 'package:alif/utils/style/theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get_it/get_it.dart';
import 'package:skeletonizer/skeletonizer.dart';

class ExplorePage extends StatelessWidget {
  ExplorePage({super.key});
  final _getIt = GetIt.I;

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => ExploreCubit()),
        BlocProvider(create: (context) => _getIt.get<UserCubit>()),
      ],
      child: ExplorePageView(),
    );
  }
}

class ExplorePageView extends StatelessWidget {
  const ExplorePageView({super.key});

  @override
  Widget build(BuildContext context) {
    // final paddingTop = MediaQuery.of(context).viewPadding.top;
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;
    final exploreCubit = context.read<ExploreCubit>();
    return Scaffold(
      extendBodyBehindAppBar: true,
      resizeToAvoidBottomInset: false,
      backgroundColor: AppColors.secondary,
      appBar: CustomeAppBar(
        height: height,
        child: TextField(
          readOnly: true,
          onTap: () => Navigator.of(context).pushNamed("/search"),
          onTapOutside: (event) => FocusScope.of(context).unfocus(),
          decoration: searchInputDecoration.copyWith(
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
      body: BlocBuilder<ExploreCubit, ExploreState>(
        builder: (context, state) {
          return  state is ExploreEmpty
              ? SafeArea(
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Spacer(flex: 10),
                      Center(
                        child: SvgPicture.asset(
                          'lib/assets/svg/search.svg',
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
                  enabled: state is ExploreInitial,
                  child: Padding(
                    padding: EdgeInsetsDirectional.symmetric(
                      horizontal: width * 0.03,
                    ),
                    child: ListView.builder(
                      physics: AlwaysScrollableScrollPhysics(),
                      itemCount: state is ExploreInitial
                          ? 10
                          : exploreCubit.types.length,
                      itemBuilder: (context, index) {
                        return CustomCategoryCard(
                          type: state is ExploreInitial
                              ? null
                              : exploreCubit.types[index],
                        );
                      },
                    ),
                  ),
                );
        },
      ),
    );
  }
}
