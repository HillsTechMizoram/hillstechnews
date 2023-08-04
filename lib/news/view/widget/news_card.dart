import 'package:hillstechnews/utils/widget_config/text_style.dart';
import 'package:hillstechnews/utils/tools/datetime_format.dart';
import 'package:extended_image/extended_image.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:responsive_ui/responsive_ui.dart';

import '../../model/news_model.dart';

class NewsCard extends HookConsumerWidget {
  final News news;
  const NewsCard(this.news, {super.key});

  @override
  Widget build(BuildContext context, ref) {
    image() => Padding(
          padding: const EdgeInsets.all(14),
          child: ClipRRect(
            borderRadius: const BorderRadius.all(Radius.circular(4)),
            child: ExtendedImage.network(
              news.image_url1,
              //  width: 400,
              fit: BoxFit.fill,
              cache: true,
              // border: Border.all(color: Colors.red, width: 1.0),
            ),
          ),
        );

    title() => SizedBox(
          // width: 400,
          child: Text(
            news.title,
            style: boldTextStyle(),
          ),
        );
    date() => Text(
          dateTimeFormat(news.date),
          style: secondaryTextStyle(),
        );
    description() => SizedBox(
          child: Text(news.description,
              overflow: TextOverflow.ellipsis,
              maxLines: 6,
              style: primaryTextStyle()),
        );

    ///---------------------------------------------
    return Card(
      elevation: 8,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(4)),
      child: Responsive(
        children: [
          Div(
              divison: const Division(
                colXS: 12,
                colS: 12,
                colM: 12,
                colL: 5,
                colXL: 5,
              ),
              child: image()),
          Div(
              divison: const Division(
                colXS: 12,
                colS: 12,
                colM: 12,
                colL: 7,
                colXL: 7,
              ),
              child: Padding(
                padding: const EdgeInsets.all(14),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    title(),
                    date(),
                    description(),
                  ],
                ),
              ))
        ],
      ),
    );
  }
}
