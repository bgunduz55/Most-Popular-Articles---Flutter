import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../data/newsarticle.dart';
import '../models/article-list-viewmodel.dart';
import '../screens/article-detail-screen.dart';

class WidgetUtil {
  static Widget generateListItemView(
      List<NewsArticle> articles, BuildContext context) {
    final viewModel = Provider.of<ArticleListViewModel>(context, listen: false);
    return ListView.builder(
      itemCount: articles.length,
      itemBuilder: (context, index) {
        final article = articles[index];
        return ListTile(
          title: Text(article.title),
          subtitle: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                article.snippet,
                overflow: TextOverflow.ellipsis,
              ),
              const SizedBox(height: 4),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    child: Text(article.writer,
                        overflow: TextOverflow.ellipsis,
                        style: const TextStyle(color: Colors.grey)),
                  ),
                  Expanded(
                    child: Text(
                      article.date,
                      textAlign: TextAlign.right,
                      style: const TextStyle(color: Colors.grey),
                    ),
                  ),
                ],
              )
            ],
          ),
          leading: CircleAvatar(
            radius: 30,
            backgroundImage: NetworkImage(article.imageUrl),
          ),
          trailing: const Icon(Icons.arrow_forward_ios),
          onTap: () {
            // Navigate to the detail screen passing the selected article
            viewModel.setSelectedArticle(article);
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => ArticleDetailScreen(),
              ),
            );
          },
        );
      },
    );
  }
}
