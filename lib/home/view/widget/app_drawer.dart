import 'package:flutter/material.dart';

import '../../../utils/theme/widget/theme_button.dart';
import '../../../utils/theme/widget/theme_toggle_switch.dart';
import '../../../utils/tools/sized_box_height.dart';

Drawer appDrawer() {
  return Drawer(
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(0)),
    child: Column(
      children: [sizedBoxHeight(50), const ThemeToggleSwitch()],
    ),
  );
}
