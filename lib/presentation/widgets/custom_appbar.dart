import 'package:alif/utils/cubits/user_cubit/user_cubit.dart';
import 'package:alif/utils/style/colors.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CustomeAppBar extends StatelessWidget implements PreferredSizeWidget {
  const CustomeAppBar({
    super.key,
    required this.height,
    required this.child,
  });
  final double height;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    final paddingTop = MediaQuery.of(context).viewPadding.top;
    final width = MediaQuery.of(context).size.width;
    return AppBar(
      backgroundColor: AppColors.transparent,
      flexibleSpace: BlocBuilder<UserCubit, UserState>(
        builder: (context, state) {
          final cubit = context.read<UserCubit>();
          return Container(
            padding: EdgeInsetsDirectional.symmetric(horizontal: width * 0.025)
                .copyWith(top: paddingTop),
            decoration: BoxDecoration(
              gradient: const LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                colors: [
                  AppColors.onPrimary,
                  AppColors.primary,
                ],
              ),
              borderRadius: const BorderRadiusDirectional.only(
                bottomStart: Radius.circular(38),
                bottomEnd: Radius.circular(38),
              ),
              boxShadow: [
                BoxShadow(
                  color: AppColors.onSurface.withOpacity(0.2),
                  offset: const Offset(0, -3.5),
                  blurRadius: 10,
                  spreadRadius: 5,
                )
              ],
            ),
            height: height * 0.25,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                SizedBox(
                  child: ListTile(
                    contentPadding: EdgeInsetsDirectional.zero,
                    leading: AspectRatio(
                      aspectRatio: 1,
                      child: Container(
                        decoration: BoxDecoration(
                          color: AppColors.transparent,
                          shape: BoxShape.circle,
                          border:
                              Border.all(width: 1, color: AppColors.surface),
                        ),
                        child: ClipOval(
                          child: CachedNetworkImage(
                            imageUrl: cubit.currentUser?.image ?? '',
                            fit: BoxFit.fitWidth,
                            alignment: Alignment.center,
                            placeholder: (context, url) => Image.asset(
                              "lib/assets/images/profile.jpg",
                              fit: BoxFit.fitWidth,
                              alignment: AlignmentDirectional.center,
                            ),
                            errorWidget: (context, url, error) => Image.asset(
                              "lib/assets/images/profile.jpg",
                              fit: BoxFit.fitWidth,
                              alignment: AlignmentDirectional.center,
                            ),
                          ),
                        ),
                      ),
                    ),
                    title: Text(
                      "مرحباً",
                      style: Theme.of(context)
                          .textTheme
                          .labelLarge!
                          .copyWith(color: AppColors.surface),
                    ),
                    subtitle: Text(
                      cubit.currentUser?.name ?? "زائر",
                      style: Theme.of(context)
                          .textTheme
                          .titleLarge!
                          .copyWith(color: AppColors.surface),
                    ),
                    trailing: IconButton(
                      onPressed: () {},
                      icon: Icon(
                        size: height * 0.03,
                        Icons.notifications_none_outlined,
                        color: AppColors.surface,
                      ),
                    ),
                  ),
                ),
                Container(
                  width: double.infinity,
                  height: height * 0.060,
                  margin:
                      EdgeInsetsDirectional.symmetric(horizontal: width * 0.05)
                          .copyWith(top: height * 0.005),
                  padding: EdgeInsetsDirectional.symmetric(
                      horizontal: width * 0.0125),
                  decoration: BoxDecoration(
                    color: AppColors.surface.withOpacity(0.35),
                    borderRadius: BorderRadius.circular(100),
                  ),
                  child: child,
                ),
              ],
            ),
          );
        },
      ),
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(height * 0.15);
}
