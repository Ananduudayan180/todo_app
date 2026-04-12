import 'package:flutter/material.dart';
import 'package:todo_app/utils/app_colors.dart';

class AppTheme {
  static ThemeData light() {
    final colorScheme = ColorScheme.fromSeed(
      seedColor: AppColors.primaryColor,
      brightness: Brightness.light,
    );
    const surfaceColor = Color(0xFFFFFFFF);
    const scaffoldColor = Color(0xFFF6F8FB);

    return ThemeData(
      useMaterial3: true,
      colorScheme: colorScheme,
      scaffoldBackgroundColor: scaffoldColor,
      canvasColor: scaffoldColor,
      drawerTheme: const DrawerThemeData(backgroundColor: Colors.transparent),
      appBarTheme: AppBarTheme(
        backgroundColor: scaffoldColor,
        foregroundColor: colorScheme.onSurface,
        elevation: 0,
        surfaceTintColor: Colors.transparent,
      ),
      bottomSheetTheme: const BottomSheetThemeData(
        backgroundColor: surfaceColor,
        surfaceTintColor: Colors.transparent,
      ),
      dialogTheme: const DialogThemeData(
        backgroundColor: surfaceColor,
        surfaceTintColor: Colors.transparent,
      ),
      listTileTheme: ListTileThemeData(iconColor: colorScheme.onSurface),
      progressIndicatorTheme: ProgressIndicatorThemeData(
        color: AppColors.primaryColor,
        circularTrackColor: colorScheme.outlineVariant,
      ),
      textTheme: _textTheme(
        primaryTextColor: Colors.black,
        secondaryTextColor: const Color(0xFF6B7280),
        onPrimaryTextColor: Colors.white,
        mutedTextColor: const Color(0xFFEAEAEA),
      ),
      dividerTheme: DividerThemeData(color: Colors.grey.shade300, thickness: 2),
      cardTheme: CardThemeData(
        color: surfaceColor,
        elevation: 0,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      ),
      inputDecorationTheme: InputDecorationTheme(
        hintStyle: TextStyle(color: Colors.grey.shade600),
        prefixIconColor: Colors.grey.shade600,
        enabledBorder: UnderlineInputBorder(
          borderSide: BorderSide(color: Colors.grey.shade300),
        ),
        focusedBorder: UnderlineInputBorder(
          borderSide: BorderSide(color: colorScheme.primary),
        ),
      ),
    );
  }

  static ThemeData dark() {
    final colorScheme = ColorScheme.fromSeed(
      seedColor: AppColors.primaryColor,
      brightness: Brightness.dark,
    );
    const scaffoldColor = Color(0xFF101418);
    const surfaceColor = Color(0xFF182028);

    return ThemeData(
      useMaterial3: true,
      colorScheme: colorScheme,
      scaffoldBackgroundColor: scaffoldColor,
      canvasColor: scaffoldColor,
      drawerTheme: const DrawerThemeData(backgroundColor: Colors.transparent),
      appBarTheme: AppBarTheme(
        backgroundColor: scaffoldColor,
        foregroundColor: colorScheme.onSurface,
        elevation: 0,
        surfaceTintColor: Colors.transparent,
      ),
      bottomSheetTheme: const BottomSheetThemeData(
        backgroundColor: surfaceColor,
        surfaceTintColor: Colors.transparent,
      ),
      dialogTheme: const DialogThemeData(
        backgroundColor: surfaceColor,
        surfaceTintColor: Colors.transparent,
      ),
      listTileTheme: ListTileThemeData(iconColor: colorScheme.onSurface),
      progressIndicatorTheme: ProgressIndicatorThemeData(
        color: AppColors.primaryColor,
        circularTrackColor: colorScheme.outlineVariant,
      ),
      textTheme: _textTheme(
        primaryTextColor: Colors.white,
        secondaryTextColor: const Color(0xFFB6C0CA),
        onPrimaryTextColor: Colors.white,
        mutedTextColor: const Color(0xFFCFD8DC),
      ),
      dividerTheme: DividerThemeData(
        color: Colors.white.withValues(alpha: 0.08),
        thickness: 2,
      ),
      cardTheme: CardThemeData(
        color: surfaceColor,
        elevation: 0,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      ),
      inputDecorationTheme: InputDecorationTheme(
        hintStyle: TextStyle(color: Colors.grey.shade400),
        prefixIconColor: Colors.grey.shade400,
        enabledBorder: UnderlineInputBorder(
          borderSide: BorderSide(color: Colors.white.withValues(alpha: 0.12)),
        ),
        focusedBorder: UnderlineInputBorder(
          borderSide: BorderSide(color: colorScheme.primary),
        ),
      ),
    );
  }

  static TextTheme _textTheme({
    required Color primaryTextColor,
    required Color secondaryTextColor,
    required Color onPrimaryTextColor,
    required Color mutedTextColor,
  }) {
    return TextTheme(
      displayLarge: TextStyle(
        color: primaryTextColor,
        fontSize: 45,
        fontWeight: FontWeight.bold,
      ),
      displayMedium: TextStyle(color: onPrimaryTextColor, fontSize: 21),
      displaySmall: TextStyle(
        color: mutedTextColor,
        fontSize: 14,
        fontWeight: FontWeight.w400,
      ),
      headlineMedium: TextStyle(
        color: primaryTextColor,
        fontSize: 24,
        fontWeight: FontWeight.w700,
      ),
      titleMedium: TextStyle(
        color: secondaryTextColor,
        fontSize: 16,
        fontWeight: FontWeight.w300,
      ),
      titleSmall: TextStyle(
        color: primaryTextColor,
        fontSize: 14,
        fontWeight: FontWeight.w500,
      ),
      bodyLarge: TextStyle(
        color: primaryTextColor,
        fontSize: 16,
        fontWeight: FontWeight.w600,
      ),
      bodyMedium: TextStyle(color: secondaryTextColor, fontSize: 14),
    );
  }
}
