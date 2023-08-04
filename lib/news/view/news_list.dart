import 'package:hillstechnews/news/controller/news_controller.dart';
import 'package:hillstechnews/news/view/news_details_screen.dart';
import 'package:hillstechnews/news/view/widget/news_card.dart';
import 'package:hillstechnews/utils/screen_route/cupertino_route.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

import '../../utils/tools/launch_url.dart';
import '../model/news_model.dart';

class NewsList extends HookConsumerWidget {
  const NewsList({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(newsControllerProvider);
    final isLoadingMore = useState(false);
    RefreshController refreshController = RefreshController();
    loadMore() async {
      await ref.watch(newsControllerProvider.notifier).loadMore();
    }

    void onLoadMore() async {
      //print('Try to loadmore');

      if (!isLoadingMore.value) {
        isLoadingMore.value = true;
        debugPrint('Loadmore');
        loadMore().whenComplete(() {
          isLoadingMore.value = false;

          refreshController.loadComplete();
          debugPrint('reset to false-----------------');
        });
      }
    }

    loadmoreButton() => Center(
          child: Container(
            height: 40,
            width: 100,
            margin: const EdgeInsets.all(8.0),
            child: isLoadingMore.value
                ? const CupertinoActivityIndicator()
                : MaterialButton(
                    color: Theme.of(context).cardColor,
                    elevation: 10,
                    onPressed: () {
                      onLoadMore();
                    },
                    child: const Text('Loadmore'),
                  ),
          ),
        );

    return Scaffold(
      body: state.when(
          data: (newsState) {
            return ListView.builder(
                shrinkWrap: true,
                itemCount: newsState.newsList.length + 1,
                itemBuilder: (_, index) {
                  if (index < newsState.newsList.length) {
                    News news = newsState.newsList[index];
                    return Padding(
                        padding: const EdgeInsets.symmetric(
                            vertical: 8, horizontal: 14),
                        child: GestureDetector(
                            onTap: () {
                              checkPlatformAndLunchUrl();
                            },
                            child: NewsCard(news)));
                  } else {
                    return loadmoreButton();
                  }
                });
          },
          //// error and loading ---------------
          error: (e, _) => Center(
                child: Text(e.toString()),
              ),
          loading: () => const Center(child: CupertinoActivityIndicator())),
    );
  }
}
