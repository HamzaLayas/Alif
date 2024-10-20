import 'package:alif/presentation/home/pages/home_page/home_cubit/home_cubit.dart';
import 'package:alif/presentation/widgets/main_widgets/custom_appbar.dart';
import 'package:alif/presentation/widgets/main_widgets/custom_featured_banner.dart';
import 'package:alif/presentation/widgets/main_widgets/custom_new_card.dart';
import 'package:alif/presentation/widgets/main_widgets/custom_trending_card.dart';
import 'package:alif/utils/style/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_carousel_widget/flutter_carousel_widget.dart';
import 'package:skeletonizer/skeletonizer.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => HomeCubit(),
      child: HomePageView(),
    );
  }
}

class HomePageView extends StatelessWidget {
  const HomePageView({super.key});

  @override
  Widget build(BuildContext context) {
    final paddingTop = MediaQuery.of(context).viewPadding.top;
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;
    final homeCubit = context.read<HomeCubit>();
    return Scaffold(
      extendBodyBehindAppBar: true,
      resizeToAvoidBottomInset: false,
      backgroundColor: AppColors.secondary,
      appBar: CustomeAppBar(
        height: height,
        child: SizedBox.shrink(),
      ),
      body: BlocBuilder<HomeCubit, HomeState>(
        builder: (context, state) {
          return Skeletonizer(
            enabled: state is HomeInitial,
            child: CustomScrollView(
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
                        autoPlay: true,
                        viewportFraction: 1,
                        floatingIndicator: false,
                        enableInfiniteScroll: true,
                        slideIndicator: CircularWaveSlideIndicator(),
                        autoPlayInterval: const Duration(seconds: 5),
                        autoPlayCurve: Curves.easeInOutCubic,
                      ),
                      itemCount: state is HomeInitial
                          ? 3
                          : homeCubit.featuredServices.length,
                      itemBuilder: (context, index, realIndex) =>
                          CustomFeaturedBanner(
                        service: state is HomeInitial
                            ? null
                            : homeCubit.featuredServices[index],
                      ),
                    ),
                  ),
                ),
                SliverPadding(
                  padding: EdgeInsetsDirectional.symmetric(
                          horizontal: width * 0.03)
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
                    child: ListView.separated(
                      itemCount: state is HomeInitial
                          ? 3
                          : homeCubit.trendingServices.length,
                      padding: EdgeInsetsDirectional.symmetric(
                        horizontal: width * 0.02,
                      ),
                      scrollDirection: Axis.horizontal,
                      separatorBuilder: (context, index) =>
                          SizedBox(width: width * 0.03),
                      itemBuilder: (context, index) {
                        return CustomTrendingCard(
                          service: state is HomeInitial
                              ? null
                              : homeCubit.trendingServices[index],
                        );
                      },
                    ),
                  ),
                ),
                SliverPadding(
                  padding: EdgeInsetsDirectional.symmetric(
                          horizontal: width * 0.03)
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
                    itemCount:
                        state is HomeInitial ? 3 : homeCubit.newServices.length,
                    separatorBuilder: (context, index) {
                      return SizedBox(height: height * 0.0125);
                    },
                    itemBuilder: (context, index) {
                      return CustomNewCard(
                        service: state is HomeInitial
                            ? null
                            : homeCubit.newServices[index],
                      );
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
          );
        },
      ),
    );
  }
}
