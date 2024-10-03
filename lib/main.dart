import 'package:alif/presentation/auth/retrieve_password_screen.dart';
import 'package:alif/presentation/auth/login_screen.dart';
import 'package:alif/presentation/auth/register_screen.dart';
import 'package:alif/presentation/home/main_screen.dart';
import 'package:alif/utils/style/theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Alif',
      initialRoute: "/main",
      routes: {
        '/main': (contex) => const MainScreen(),
        '/login': (contex) => const LoginScreen(),
        '/register': (contex) => const RegisterScreen(),
        '/retrieve': (contex) => const RetrievePasswordScreen(),
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
      debugShowCheckedModeBanner: false,
    );
  }
}
