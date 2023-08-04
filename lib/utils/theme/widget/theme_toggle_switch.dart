import 'package:hillstechnews/utils/theme/theme_controller.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_switch/flutter_switch.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class ThemeToggleSwitch extends HookConsumerWidget {
  const ThemeToggleSwitch({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final value = useState(
        ref.watch(themeControllerProvider.notifier).state != ThemeMode.dark);

    return SizedBox(
      height: 32,
      width: 70,
      child: FlutterSwitch(
        width: 68.0,
        height: 36.0,
        valueFontSize: 25.0,
        toggleSize: 32.0,
        value: value.value,
        activeColor: Colors.grey.shade400,
        inactiveColor: Colors.grey.shade400,
        activeToggleColor: Colors.blue,
        inactiveToggleColor: Colors.grey.shade800,

        borderRadius: 30.0,
        padding: 2,
        duration: const Duration(milliseconds: 100),
        //  showOnOff: true,
        activeIcon: const Icon(
          CupertinoIcons.sun_max,
          color: Colors.white,
        ),

        inactiveIcon: Icon(
          CupertinoIcons.moon,
          color: Colors.grey.shade200,
        ),
        onToggle: (val) {
          val
              ? ref.watch(themePreferences).changeTheme(ThemeMode.light)
              : ref.watch(themePreferences).changeTheme(ThemeMode.dark);
          value.value = val;
        },
      ),
    );
  }
}
