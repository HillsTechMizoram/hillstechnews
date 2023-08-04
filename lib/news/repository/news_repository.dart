import 'package:hillstechnews/utils/constant/firebase_constant.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import '../model/news_model.dart';

final newsRepositoryProvider =
    Provider<NewsRepository>((ref) => NewsRepository(ref));

class NewsRepository {
  final Ref _ref;
  NewsRepository(this._ref);
  // Number of documents to load in each batch
  DocumentSnapshot? lastDocument; // Last document from the previous batch
  final firebase = FirebaseFirestore.instance;
  // Function to fetch the initial batch of news
  Future<List<News>> fetchNews() async {
    List<News> newsList = [];
    try {
      final snapshot =
          await firebase.collection(newsColection).limit(paginate).get();

      newsList = snapshot.docs.map((doc) => News.fromMap(doc.data())).toList();

      // Save the last document from this batch to use for pagination
      lastDocument = snapshot.docs.isNotEmpty ? snapshot.docs.last : null;
    } catch (e) {
      print('Error fetching initial news: $e');
      rethrow;
    }
    return newsList;
  }

  // Function to fetch the next batch of news for pagination
  Future<List<News>> fetchMoreNews() async {
    List<News> newsList = [];
    try {
      if (lastDocument != null) {
        final snapshot = await firebase
            .collection(newsColection)
            .startAfterDocument(lastDocument!)
            .limit(paginate)
            .get();

        newsList =
            snapshot.docs.map((doc) => News.fromMap(doc.data())).toList();

        // Update the last document for the next pagination
        lastDocument = snapshot.docs.isNotEmpty ? snapshot.docs.last : null;
      }
    } catch (e) {
      print('Error fetching more news: $e');
      rethrow;
    }
    return newsList;
  }

  Future<List<News>> fetchNewsByCategory(String category) async {
    List<News> newsList = [];
    try {
      final snapshot = await firebase
          .collection(newsColection)
          .where('category', isEqualTo: category)
          .limit(paginate)
          .get();

      newsList = snapshot.docs.map((doc) => News.fromMap(doc.data())).toList();

      // Save the last document from this batch to use for pagination
      lastDocument = snapshot.docs.isNotEmpty ? snapshot.docs.last : null;
    } catch (e) {
      print('Error fetching initial news: $e');
      rethrow;
    }
    return newsList;
  }

  // Function to fetch the next batch of news for pagination
  Future<List<News>> fetchNewsByCategoryLoadMore(String category) async {
    List<News> newsList = [];
    try {
      if (lastDocument != null) {
        final snapshot = await firebase
            .collection(newsColection)
            .where('category', isEqualTo: category)
            .startAfterDocument(lastDocument!)
            .limit(paginate)
            .get()
            .whenComplete(() => print('Loadmore done'));

        newsList =
            snapshot.docs.map((doc) => News.fromMap(doc.data())).toList();

        // Update the last document for the next pagination
        lastDocument = snapshot.docs.isNotEmpty ? snapshot.docs.last : null;
      }
    } catch (e) {
      print('Error fetching more news: $e');
      rethrow;
    }
    return newsList;
  }

  ///============= ADD NEWS
  addNews() async {
    try {
      await firebase
          .collection(newsColection)
          .doc(DateTime.timestamp().toString())
          .set(News(
                  agency: "agency",
                  category1: "category1",
                  category2: "category2",
                  date: DateTime.now().toString(),
                  description: "description",
                  image_courtesy: "image_courtesy",
                  image_description: "image_description",
                  image_url1:
                      "https://www.vskills.in/certification/blog/wp-content/uploads/2015/01/structure-of-a-news-report.jpg",
                  loves: 1,
                  region: "region",
                  subregion: "subregion",
                  timestamp: DateTime.now().toString(),
                  title: "title")
              .toMap())
          .whenComplete(() => print('Added'));
    } catch (e) {
      print('Error fetching initial news: $e');
      rethrow;
    }
    // return newsList;
  }
}


//

// class NewsRepository {
//   final Ref _ref;
//   NewsRepository(this._ref);

//   Future<List<News>> getNewsList() async {
//     final firebase = FirebaseFirestore.instance;
//     try {
//       List<News> newsList = [];
//       final snapshot = await firebase.collection(newsColection).get();
//       for (var element in snapshot.docs) {
//         newsList.add(News.fromMap(element.data()));
//       }

//       return newsList;
//     } catch (e) {
//       rethrow;
//     }
//   }

//   Future<List<News>> fetchNewsByCategory(String category) async {
//     final firebase = FirebaseFirestore.instance;
//     try {
//       List<News> newsList = [];
//       final snapshot = await firebase
//           .collection('newsCollection')
//           .where('category', isEqualTo: category)
//           .get();
//       for (var element in snapshot.docs) {
//         newsList.add(News.fromMap(element.data()));
//       }

//       return newsList;
//     } catch (e) {
//       rethrow;
//     }
//   }
// }
