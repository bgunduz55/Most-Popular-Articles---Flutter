import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:provider/provider.dart';
import 'package:most_popular_articles_bgunduz/data/newsarticle.dart';
import 'package:most_popular_articles_bgunduz/models/article-list-viewmodel.dart';
import 'package:most_popular_articles_bgunduz/screens/article-detail-screen.dart';

void main() {
  testWidgets('ArticleDetailScreen widget test', (WidgetTester tester) async {
    final mockViewModel = MockArticleListViewModel();

    final article = NewsArticle(
      title: "Test Title",
      snippet: "Test Snippet",
      imageUrl: "https://googleflutter.com/sample_image.jpg",
      writer: "Test Writer",
      date: "2023-07-20",
    );

    mockViewModel.selectedArticle = article;

    await tester.pumpWidget(
      MultiProvider(
        providers: [
          ChangeNotifierProvider<ArticleListViewModel>.value(
            value: mockViewModel,
          ),
        ],
        child: const MaterialApp(
          home: ArticleDetailScreen(),
        ),
      ),
    );

    expect(find.text(article.title, skipOffstage: false), findsWidgets);
    expect(find.text(article.snippet, skipOffstage: false), findsOneWidget);
    expect(find.text(article.writer, skipOffstage: false), findsOneWidget);
    expect(find.text("Published: ${article.date}", skipOffstage: false),
        findsOneWidget);
    expect(find.byType(Image), findsOneWidget);
  });
}

class MockArticleListViewModel extends ArticleListViewModel {
  @override
  NewsArticle selectedArticle = NewsArticle(
    title: "Test Title",
    snippet: "Test Snippet",
    imageUrl: "https://googleflutter.com/sample_image.jpg",
    writer: "Test Writer",
    date: "2023-07-20",
  );
}
