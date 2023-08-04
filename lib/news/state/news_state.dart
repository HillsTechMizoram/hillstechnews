// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:hillstechnews/news/model/news_model.dart';

class NewsState {
  List<News> newsList;
  int page;
  NewsState({
    required this.newsList,
    required this.page,
  });
  NewsState copyWith({
    List<News>? newsList,
    int? page,
  }) {
    return NewsState(
      newsList: newsList ?? this.newsList,
      page: page ?? this.page,
    );
  }
}




// class NewsState {
// int page=0;
// bool isLastPage=false;
// List<News> news;
//   NewsState({
//     required this.page,
//     required this.isLastPage,
//     required this.news,
//   });

//   NewsState copyWith({
//     int? page,
//     bool? isLastPage,
//     List<News>? news,
//   }) {
//     return NewsState(
//       page: page?? this.page,
//       isLastPage: isLastPage?? this.isLastPage,
//       news: news ?? this.news,
//     );
//   }
// }
