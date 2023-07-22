import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../data/newsarticle.dart';
import '../models/article-list-viewmodel.dart';

class ArticleDetailScreen extends StatelessWidget {
  const ArticleDetailScreen();

  @override
  Widget build(BuildContext context) {
    final viewModel = Provider.of<ArticleListViewModel>(context, listen: false);
    NewsArticle article = viewModel.selectedArticle;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xFF50e3c2),
        foregroundColor: Colors.white,
        title: Text(
          article.title,
          overflow: TextOverflow.ellipsis,
        ),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: Image.network(article.imageUrl,
                  errorBuilder: ((context, error, stackTrace) =>
                      const Icon(Icons.account_circle))),
            ),
            const SizedBox(height: 16),
            Text(
              article.title,
              style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),
            Text(article.snippet, style: const TextStyle(fontSize: 16)),
            const SizedBox(height: 16),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: Text(
                    article.writer,
                    style: const TextStyle(fontSize: 14),
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
                Expanded(
                  child: Text(
                    'Published: ${article.date}',
                    style: const TextStyle(fontSize: 14),
                    textAlign: TextAlign.right,
                  ),
                )
              ],
            ),
            const SizedBox(height: 16),
          ],
        ),
      ),
    );
  }
}
