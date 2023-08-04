import 'package:hillstechnews/home/view/widget/app_drawer.dart';
import 'package:hillstechnews/news/view/news_list.dart';
import 'package:hillstechnews/utils/theme/widget/theme_toggle_button.dart';
import 'package:hillstechnews/utils/tools/sized_box_height.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class HomeScreen extends HookConsumerWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context, ref) {
    return Scaffold(
      drawer: appDrawer(),
      appBar: AppBar(
        elevation: 4,
        centerTitle: true,
        shadowColor: Colors.black,
        title: const Text('aDumAVar'),
        // actions: const [
        //   ChangeThemeButton(),
        // ],
      ),
      body: Center(
        child: SizedBox(width: 900, child: NewsList())),
    );
  }
}
