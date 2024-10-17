import 'package:alif/presentation/home/pages/home_page/home_cubit/home_cubit.dart';
import 'package:alif/presentation/widgets/main_widgets/custom_appbar.dart';
import 'package:alif/presentation/widgets/main_widgets/custom_featured_banner.dart';
import 'package:alif/presentation/widgets/main_widgets/custom_new_card.dart';
import 'package:alif/presentation/widgets/main_widgets/custom_trending_card.dart';
import 'package:alif/utils/cubits/user_cubit/user_cubit.dart';
import 'package:alif/utils/style/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_carousel_widget/flutter_carousel_widget.dart';
import 'package:get_it/get_it.dart';

class HomePage extends StatelessWidget {
  HomePage({super.key});
  final _getIt = GetIt.I;

  @override
  Widget build(BuildContext context) {
    final paddingTop = MediaQuery.of(context).viewPadding.top;
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => HomeCubit()),
        BlocProvider(create: (context) => _getIt.get<UserCubit>()),
      ],
      child: Scaffold(
        extendBodyBehindAppBar: true,
        resizeToAvoidBottomInset: false,
        backgroundColor: AppColors.secondary,
        appBar: CustomeAppBar(
          height: height,
          child: SizedBox.shrink(),
        ),
        body: CustomScrollView(
          slivers: [
            SliverPadding(
              padding: EdgeInsetsDirectional.only(
                top: paddingTop + (height * 0.15),
                bottom: height * 0.0125,
              ),
            ),
            SliverToBoxAdapter(
              child: SizedBox(
                height: height * 0.225,
                child: FlutterCarousel.builder(
                  options: FlutterCarouselOptions(
                    autoPlay: false,
                    viewportFraction: 1,
                    floatingIndicator: false,
                    enableInfiniteScroll: false,
                    slideIndicator: CircularWaveSlideIndicator(),
                    autoPlayInterval: const Duration(seconds: 3),
                  ),
                  itemCount: 1,
                  itemBuilder: (context, index, realIndex) =>
                      CustomFeaturedBanner(),
                ),
              ),
            ),
            SliverPadding(
              padding: EdgeInsetsDirectional.symmetric(horizontal: width * 0.03)
                  .copyWith(top: height * 0.0125, bottom: height * 0.005),
              sliver: SliverToBoxAdapter(
                child: Text(
                  "الأنـشـطـة الـرائـجـة",
                  style: Theme.of(context)
                      .textTheme
                      .titleLarge!
                      .copyWith(fontWeight: FontWeight.w600),
                ),
              ),
            ),
            SliverToBoxAdapter(
              child: AspectRatio(
                aspectRatio: 375 / 230,
                child: Container(
                  foregroundDecoration: BoxDecoration(
                    gradient: LinearGradient(
                      begin: AlignmentDirectional.centerStart,
                      end: AlignmentDirectional.centerEnd,
                      colors: [
                        AppColors.secondary,
                        AppColors.secondary.withOpacity(0),
                        AppColors.secondary.withOpacity(0),
                        AppColors.secondary,
                      ],
                      stops: [0.0, 0.075, 0.925, 1.0],
                    ),
                  ),
                  child: ListView.separated(
                    itemCount: 5,
                    padding: EdgeInsetsDirectional.symmetric(
                      horizontal: width * 0.02,
                    ),
                    scrollDirection: Axis.horizontal,
                    separatorBuilder: (context, index) =>
                        SizedBox(width: width * 0.03),
                    itemBuilder: (context, index) {
                      return CustomTrendingCard();
                    },
                  ),
                ),
              ),
            ),
            SliverPadding(
              padding: EdgeInsetsDirectional.symmetric(horizontal: width * 0.03)
                  .copyWith(top: height * 0.0125, bottom: height * 0.005),
              sliver: SliverToBoxAdapter(
                child: Text(
                  "الأنـشـطـة الـجـديـدة",
                  style: Theme.of(context)
                      .textTheme
                      .titleLarge!
                      .copyWith(fontWeight: FontWeight.w600),
                ),
              ),
            ),
            SliverPadding(
              padding:
                  EdgeInsetsDirectional.symmetric(horizontal: width * 0.02),
              sliver: SliverList.separated(
                itemCount: 1,
                separatorBuilder: (context, index) {
                  return SizedBox(height: height * 0.0125);
                },
                itemBuilder: (context, index) {
                  return CustomNewCard();
                },
              ),
            ),
            SliverPadding(
              padding: EdgeInsetsDirectional.only(
                top: height * 0.0125,
                bottom: height * 0.0775,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
