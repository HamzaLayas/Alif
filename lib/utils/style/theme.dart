import 'package:alif/utils/style/colors.dart';
import 'package:flutter/material.dart';

class AppTheme {
  static ThemeData get theme {
    return ThemeData(
      useMaterial3: true,
      fontFamily: "Urbanist",
      colorScheme: AppColorScheme.colorScheme,
      dividerTheme: DividerThemeData(color: AppColors.onSurfaceVariant),
      inputDecorationTheme: AppInputDecoration.theme,
      elevatedButtonTheme: AppElevatedButton.themeData,
      outlinedButtonTheme: AppOutlinedButton.themeData,
      textButtonTheme: AppTextButton.themeData,
      iconButtonTheme: AppIcontButton.themeData,
    );
  }
}

class AppIcontButton {
  static IconButtonThemeData get themeData {
    return IconButtonThemeData(
      style: IconButton.styleFrom(
        padding: EdgeInsetsDirectional.zero,
        visualDensity: VisualDensity.compact,
      ),
    );
  }
}

class AppTextButton {
  static TextButtonThemeData get themeData {
    return TextButtonThemeData(
      style: TextButton.styleFrom(
        elevation: 0,
        padding: EdgeInsetsDirectional.zero,
        foregroundColor: AppColors.secondary,
        surfaceTintColor: AppColors.transparent,
        backgroundColor: AppColors.transparent,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(50),
        ),
      ),
    );
  }
}

class AppOutlinedButton {
  static OutlinedButtonThemeData get themeData {
    return OutlinedButtonThemeData(
      style: OutlinedButton.styleFrom(
        elevation: 0,
        padding: EdgeInsetsDirectional.zero,
        surfaceTintColor: AppColors.transparent,
        foregroundColor: AppColors.onSurface,
        disabledForegroundColor: AppColors.onSurface,
        disabledBackgroundColor: AppColors.surface,
        backgroundColor: AppColors.secondary,
        minimumSize: const Size.fromHeight(70),
        shape: RoundedRectangleBorder(
          side: BorderSide(width: 1, color: AppColors.primary),
          borderRadius: BorderRadius.circular(16),
        ),
      ),
    );
  }
}

class AppElevatedButton {
  static ElevatedButtonThemeData get themeData {
    return ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        padding: EdgeInsetsDirectional.zero,
        foregroundColor: AppColors.onPrimary,
        surfaceTintColor: AppColors.transparent,
        backgroundColor: AppColors.surface,
        minimumSize: const Size.fromHeight(58),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(50),
        ),
      ),
    );
  }
}

class AppInputDecoration {
  static InputDecorationTheme get theme {
    return InputDecorationTheme(
      filled: true,
      fillColor: AppColors.surface,
      suffixIconColor: AppColors.onSurfaceVariant,
      // contentPadding: EdgeInsetsDirectional.zero,
      constraints: const BoxConstraints(minHeight: 56),
      border: OutlineInputBorder(
        borderSide: const BorderSide(
          color: AppColors.onSecondary,
        ),
        borderRadius: BorderRadius.circular(12),
      ),
      enabledBorder: OutlineInputBorder(
        borderSide: const BorderSide(
          color: AppColors.onSecondary,
        ),
        borderRadius: BorderRadius.circular(12),
      ),
      focusedBorder: OutlineInputBorder(
        borderSide: const BorderSide(
          color: AppColors.primary,
        ),
        borderRadius: BorderRadius.circular(12),
      ),
    );
  }
}

class AppColorScheme {
  static ColorScheme get colorScheme {
    return const ColorScheme(
      brightness: AppColors.brightness,
      primary: AppColors.primary,
      onPrimary: AppColors.onPrimary,
      secondary: AppColors.secondary,
      onSecondary: AppColors.onSecondary,
      surface: AppColors.surface,
      onSurface: AppColors.onSurface,
      onSurfaceVariant: AppColors.onSurfaceVariant,
      outline: AppColors.onSurface,
      //tertiary: AppColors.tertiary,
      //onTertiary: AppColors.onTertiary,
      error: AppColors.error,
      onError: AppColors.onError,
    );
  }
}
