import 'package:alif/presentation/widgets/main_widgets/custom_appbar.dart';
import 'package:alif/presentation/widgets/settings_widgets/custom_settings_card.dart';
import 'package:alif/presentation/widgets/settings_widgets/custom_settings_list_tile.dart';
import 'package:alif/utils/cubits/user_cubit/user_cubit.dart';
import 'package:alif/utils/style/alif_icons.dart';
import 'package:alif/utils/style/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ProfilePage extends StatelessWidget {
  ProfilePage({super.key});
  final _getIt = GetIt.I;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => _getIt.get<UserCubit>(),
      child: ProfilePageView(),
    );
  }
}

class ProfilePageView extends StatelessWidget {
  const ProfilePageView({super.key});

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;
    return Scaffold(
      extendBodyBehindAppBar: true,
      backgroundColor: AppColors.secondary,
      resizeToAvoidBottomInset: false,
      appBar: CustomeAppBar(
        height: height,
        child: BlocBuilder<UserCubit, UserState>(
          builder: (context, state) {
            final cubit = context.read<UserCubit>();
            return Padding(
              padding: EdgeInsetsDirectional.symmetric(vertical: width * 0.015),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Expanded(
                    child: TextButton(
                      onPressed: () {},
                      child: Text(
                        '${cubit.currentUser!.wallet!.balance ?? 0} ديـنـار',
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
                        'أشـتـرك الأن',
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
            );
          },
        ),
      ),
      body: SafeArea(
        left: false,
        right: false,
        child: Padding(
          padding: EdgeInsetsDirectional.symmetric(horizontal: width * 0.03),
          child: Column(
            mainAxisSize: MainAxisSize.max,
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              CustomSettingsCard(
                children: [
                  CustomSettingsListTile(
                    title: "الـمـحـفـظـة",
                    icon: AlifIcons.wallet,
                    onTap: () {},
                  ),
                  CustomSettingsListTile(
                    title: "الأشـتـراكـات",
                    icon: AlifIcons.sub,
                    onTap: () {},
                  ),
                ],
              ),
              CustomSettingsCard(
                children: [
                  CustomSettingsListTile(
                    title: "تـعـديـل الـبـيـانـات الـشـخـصـيـة",
                    icon: AlifIcons.details,
                    onTap: () => Navigator.pushNamed(context, "/details"),
                  ),
                  CustomSettingsListTile(
                    title: "تـغـيـر بـريـد الإلـكـتـرونـي",
                    icon: AlifIcons.email,
                    onTap: () => Navigator.pushNamed(context, "/email"),
                  ),
                  CustomSettingsListTile(
                    title: "تـغـيـر كـلـمـة الـمـرور",
                    icon: AlifIcons.key,
                    onTap: () => Navigator.pushNamed(context, "/password"),
                  ),
                ],
              ),
              CustomSettingsCard(
                children: [
                  CustomSettingsListTile(
                    title: "الأطـفـال",
                    icon: AlifIcons.kids,
                    onTap: () {},
                  ),
                  CustomSettingsListTile(
                    title: "الـعـنـاويـن",
                    icon: AlifIcons.location,
                    onTap: () {},
                  ),
                ],
              ),
              CustomSettingsCard(
                children: [
                  CustomSettingsListTile(
                    title: "الـمـسـاعدة والـدعم",
                    icon: AlifIcons.help,
                    onTap: () {},
                  ),
                  CustomSettingsListTile(
                    title: "تـواصـل مـعـنـا",
                    icon: AlifIcons.contact_us,
                    onTap: () {},
                  ),
                  CustomSettingsListTile(
                    title: "سـيـاسـة الـخـصـوصـيـة",
                    icon: AlifIcons.privacy,
                    onTap: () {},
                  ),
                ],
              ),
              CustomSettingsCard(
                children: [
                  CustomSettingsListTile(
                    title: "تـسـجـيـل الـخـروج",
                    icon: AlifIcons.sign_out,
                    onTap: () async {
                      await SharedPreferences.getInstance().then((prefs) {
                        prefs.remove('token').then(
                              (boolean) => Navigator.pushReplacementNamed(
                                context,
                                "/splash",
                              ),
                            );
                      });
                    },
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
