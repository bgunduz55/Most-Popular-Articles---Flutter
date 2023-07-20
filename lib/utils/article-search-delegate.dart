import 'package:flutter/material.dart';

import '../data/newsarticle.dart';
import '../models/article-list-viewmodel.dart';
import 'widget-util.dart';

class ArticleSearchDelegate extends SearchDelegate<String> {
  final ArticleListViewModel viewModel;

  ArticleSearchDelegate({required this.viewModel});

  @override
  List<Widget> buildActions(BuildContext context) {
    return [
      IconButton(
        icon: Icon(Icons.clear),
        onPressed: () {
          query = '';
        },
      ),
    ];
  }

  @override
  Widget buildLeading(BuildContext context) {
    return IconButton(
      icon: Icon(Icons.arrow_back),
      onPressed: () {
        close(context, '');
      },
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    return searchResults(context);
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    return searchResults(context);
  }

  Widget searchResults(BuildContext context) {
    final List<NewsArticle> searchResults = viewModel.articles
        .where((article) =>
            article.title.toLowerCase().contains(query.toLowerCase()))
        .toList();

    return WidgetUtil.generateListItemView(searchResults, context);
  }
}
