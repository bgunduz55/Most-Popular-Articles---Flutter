import 'package:mockito/mockito.dart';
import 'package:most_popular_articles_bgunduz/data/newsarticle.dart';
import 'package:most_popular_articles_bgunduz/models/article-list-viewmodel.dart';

class MockArticleListViewModel extends Mock implements ArticleListViewModel {
  @override
  List<NewsArticle> articles = [];

  @override
  bool isLoading = false;

  @override
  Future<void> fetchArticles() async {
    isLoading = true;
    notifyListeners();

    await Future.delayed(const Duration(seconds: 1));

    NewsArticle newsArticle = NewsArticle(
      title: "Title",
      snippet: "Snippet",
      imageUrl: "imageUrl",
      writer: "Writer",
      date: "Date",
    );

    articles.add(newsArticle);

    isLoading = false;
    notifyListeners();

    return;
  }
}
