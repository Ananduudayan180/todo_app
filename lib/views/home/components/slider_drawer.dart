import 'package:flutter/material.dart';
import 'package:todo_app/extensions/space_exs.dart';
import 'package:todo_app/main.dart';
import 'package:todo_app/utils/app_colors.dart';

class CustomDrawer extends StatelessWidget {
  const CustomDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    final themeController = AppScope.of(context).themeController;

    return AnimatedBuilder(
      animation: themeController,
      builder: (context, _) {
        return Container(
          padding: const EdgeInsets.symmetric(vertical: 90),
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              colors: AppColors.primaryGradientColor,
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              20.h,
              SwitchListTile(
                value: themeController.isDarkMode,
                onChanged: themeController.toggleTheme,
                activeThumbColor: Colors.white,
                inactiveThumbColor: Colors.white,
                inactiveTrackColor: Colors.white30,
                thumbIcon: WidgetStateProperty.resolveWith((states) {
                  if (states.contains(WidgetState.selected)) {
                    return const Icon(
                      Icons.dark_mode_rounded,
                      color: AppColors.primaryColor,
                    );
                  }
                  return const Icon(
                    Icons.light_mode_rounded,
                    color: AppColors.primaryColor,
                  );
                }),
                title: Text(
                  themeController.isDarkMode ? 'Dark Mode' : 'Light Mode',
                  style: const TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                secondary: Icon(
                  themeController.isDarkMode
                      ? Icons.dark_mode_rounded
                      : Icons.light_mode_rounded,
                  color: Colors.white,
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
