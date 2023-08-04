import 'package:hillstechnews/utils/theme/theme_controller.dart';
import 'package:hillstechnews/utils/widget_config/text_style.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class ChangeThemeButton extends HookConsumerWidget {
  const ChangeThemeButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, ref) {
    return TextButton.icon(
      label: Text(
        'Change Theme',
      ),
      onPressed: () {
        ref.watch(themeControllerProvider.notifier).state == ThemeMode.light
            ? ref.watch(themePreferences).changeTheme(ThemeMode.dark)
            : ref.watch(themePreferences).changeTheme(ThemeMode.light);
      },
      icon: ref.watch(themeControllerProvider) == ThemeMode.light
          ? const Icon(Icons.sunny)
          : const Icon(Icons.nightlight),
    );
  }
}
