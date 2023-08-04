import 'package:hillstechnews/utils/theme/theme_controller.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class ChangeThemeButton extends HookConsumerWidget {
  const ChangeThemeButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, ref) {
    return TextButton.icon(
      label: const Text(
        'Change Theme',
      ),
      onPressed: () {
        ref.read(themeControllerProvider.notifier).state =
            ref.watch(themeControllerProvider.notifier).state == ThemeMode.light
                ? ThemeMode.dark
                : ThemeMode.light;
        //
      },
      icon: ref.watch(themeControllerProvider) == ThemeMode.light
          ? const Icon(Icons.sunny)
          : const Icon(Icons.nightlight),
    );
  }
}

///////////////////////-----------------

