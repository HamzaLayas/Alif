import 'package:alif/presentation/auth/change_email/change_email_screen.dart';
import 'package:alif/presentation/auth/retrieve_password/retrieve_password_screen.dart';
import 'package:alif/presentation/auth/login/login_screen.dart';
import 'package:alif/presentation/auth/register/register_screen.dart';
import 'package:alif/presentation/auth/change_password/change_password_screen.dart';
import 'package:alif/presentation/home/main_screen/main_screen.dart';
import 'package:alif/presentation/auth/profile_details/profile_details_screen.dart';
import 'package:alif/presentation/notification/notification_screan.dart';
import 'package:alif/presentation/search/search_screen.dart';
import 'package:alif/presentation/splash/splash_screen.dart';
import 'package:alif/utils/dependency_injection.dart';
import 'package:alif/utils/style/colors.dart';
import 'package:alif/utils/style/theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  DependencyInjection.init();
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);
  SystemChrome.setSystemUIOverlayStyle(
    SystemUiOverlayStyle(
      statusBarColor: Colors.transparent,
      statusBarIconBrightness: Brightness.dark,
      systemNavigationBarColor: AppColors.secondary,
      systemNavigationBarIconBrightness: Brightness.dark,
    ),
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Alif',
      initialRoute: "/splash",
      routes: {
        '/splash': (context) => SplashScreen(),
        '/login': (context) => LoginScreen(),
        '/register': (context) => RegisterScreen(),
        '/retrieve': (context) => RetrievePasswordScreen(),
        '/main': (context) => MainScreen(),
        '/details': (context) => ProfileDetailsScreen(),
        '/password': (context) => ChangePasswordScreen(),
        '/email': (context) => ChangeEmailScreen(),
        '/search': (context) => SearchScreen(),
        '/notification': (context) => NotificationScreen(),
      },
      locale: const Locale('ar'),
      supportedLocales: const [
        Locale('ar'),
      ],
      localizationsDelegates: const [
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      theme: AppTheme.theme,
      debugShowMaterialGrid: false,
      debugShowCheckedModeBanner: false,
    );
  }
}
