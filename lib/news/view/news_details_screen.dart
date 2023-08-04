import 'package:hillstechnews/utils/widget_config/text_style.dart';
import 'package:hillstechnews/utils/tools/datetime_format.dart';
import 'package:extended_image/extended_image.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../model/news_model.dart';

class NewsDetailsScreen extends HookConsumerWidget {
  final News news;
  const NewsDetailsScreen(this.news, {super.key});

  @override
  Widget build(BuildContext context, ref) {
    image() {
      return ExtendedImage.network(
        news.image_url1,
        width: 200,
        // height:
        fit: BoxFit.fill,
        cache: true,
        // border: Border.all(color: Colors.red, width: 1.0),
        borderRadius: const BorderRadius.all(Radius.circular(30.0)),
      );
    }

    title() => Text(
          news.title,
          style: boldTextStyle(),
        );
    date() => Text(
          dateTimeFormat(news.date),
          style: primaryTextStyle(),
        );

    ///---------------------------------------------
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        children: [image(), title(), date()],
      ),
    );
  }
}
