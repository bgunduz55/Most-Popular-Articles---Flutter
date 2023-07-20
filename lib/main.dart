import 'package:flutter/material.dart';

import 'models/article-list-viewmodel.dart';
import 'screens/article_list_screen.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(
    ChangeNotifierProvider(
      create: (context) => ArticleListViewModel(),
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    final viewModel = Provider.of<ArticleListViewModel>(context, listen: false);
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: ArticleListScreen(
        viewModel: viewModel,
      ),
    );
  }
}
