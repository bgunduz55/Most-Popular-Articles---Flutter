import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../data/newsarticle.dart';
import '../models/article-list-viewmodel.dart';
import '../services/newsservice.dart';
import '../utils/article-search-delegate.dart';
import '../utils/widget-util.dart';

class ArticleListScreen extends StatefulWidget {
  const ArticleListScreen({required this.viewModel});
  final ArticleListViewModel viewModel;
  @override
  _ArticleListScreenState createState() =>
      _ArticleListScreenState(viewModel: viewModel);
}

class _ArticleListScreenState extends State<ArticleListScreen> {
  ArticleListViewModel viewModel;
  _ArticleListScreenState({required this.viewModel});

  @override
  void initState() {
    super.initState();
    viewModel
        .fetchArticles();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xFF50e3c2),
        foregroundColor: Colors.white,
        leading: IconButton(
          icon: const Icon(Icons.menu),
          onPressed: () {
            // Handle menu icon tap
          },
        ),
        title: const Text(
          'NY Times Most Popular',
          overflow: TextOverflow.ellipsis,
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.search),
            onPressed: () {
              showSearch(
                context: context,
                delegate: ArticleSearchDelegate(viewModel: viewModel),
              );
            },
          ),
          PopupMenuButton(
            itemBuilder: (context) => [
              // Add your popup menu items here
            ],
            onSelected: (value) {
              // Handle the selected popup menu item
            },
          ),
        ],
      ),
      body: RefreshIndicator(
        onRefresh: viewModel.fetchArticles,
        child: ChangeNotifierProvider<ArticleListViewModel>(
            create: (BuildContext context) => viewModel,
            child: Consumer<ArticleListViewModel>(
              builder: (context, value, child) =>
                  WidgetUtil.generateListItemView(viewModel.articles, context),
            )),
      ),
    );
  }
}
