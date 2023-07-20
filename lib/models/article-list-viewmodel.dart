import 'package:flutter/material.dart';
import '../data/newsarticle.dart';
import '../services/newsservice.dart';

class ArticleListViewModel extends ChangeNotifier {
  List<NewsArticle> articles = [];
  late NewsArticle selectedArticle;
  bool isLoading = true;

  void setSelectedArticle(NewsArticle article) {
    selectedArticle = article;
  }

  Future<void> fetchArticles() async {
    isLoading = true;
    notifyListeners();

    try {
      final List<NewsArticle> fetchedArticles =
          await NewsService().fetchMostPopularArticles();
      articles = fetchedArticles;
    } catch (error) {
      // Handle error if necessary
    }

    isLoading = false;
    notifyListeners();
  }
}
