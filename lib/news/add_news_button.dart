import 'package:hillstechnews/news/controller/news_controller.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class AddNewsButton extends HookConsumerWidget {
  const AddNewsButton({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return TextButton(
        onPressed: () {
          ref.watch(newsControllerProvider.notifier).addNews();
        },
        child: const Text('Add News'));
  }
}
