import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import '../model/news_model.dart';
import '../repository/news_repository.dart';
import '../state/news_state.dart';

final newsControllerProvider =
    StateNotifierProvider<NewsController, AsyncValue<NewsState>>((ref) {
  return NewsController(ref)..fetchNews();
});

class NewsController extends StateNotifier<AsyncValue<NewsState>> {
  final Ref ref;
  NewsController(this.ref) : super(const AsyncValue.loading());

  fetchNews({bool isRefreshing = false}) async {
    if (isRefreshing) state = const AsyncValue.loading();
    try {
      // List<News> newsList = [];
      final result = await ref.read(newsRepositoryProvider).fetchNews();

      if (mounted) {
        // for (var element in ) {
        //  newsList.add(News.fromMap(element));
        // }
        state = AsyncData(NewsState(newsList: result, page: 1));
      }
    } catch (e) {
      state = AsyncValue.error(e, StackTrace.fromString(e.toString()));
      // UnimplementedError();
    }
  }

  loadMore() async {
    try {
      List<News> currentNews = [];
      //  List<News> tempList = [];
      state.whenData((value) => currentNews = value.newsList);
      debugPrint('try to load ${state.value!.page + 1}');
      final result = await ref.watch(newsRepositoryProvider).fetchMoreNews();

      if (mounted) {
        // for (var element in result.news) {
        //   tempList.add();
        // //}
        //  currentNews.add(result);

        ///
        currentNews.addAll(result);
        state = AsyncData(NewsState(newsList: currentNews, page: 1));
        debugPrint('currentpage  ${state.value!.page + 1}');
      }
    } catch (e) {
      state = AsyncValue.error(e, StackTrace.fromString(e.toString()));
    }

    // //--Revert the state when error
    // state.whenData((value) {
    //   state = AsyncData(
    //     state.value!.copyWith(
    //       page: state.value!.page - 1,
    //     ),
    //   );
    // });
  }

  addNews() {
    ref.watch(newsRepositoryProvider).addNews();
  }
}
