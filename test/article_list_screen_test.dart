import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:provider/provider.dart';
import 'package:most_popular_articles_bgunduz/main.dart';
import 'package:most_popular_articles_bgunduz/screens/article_list_screen.dart';
import 'package:most_popular_articles_bgunduz/utils/widget-util.dart';
import 'package:most_popular_articles_bgunduz/models/article-list-viewmodel.dart';
import 'package:mockito/mockito.dart';

import 'mock-article-list-viewmodel.dart';

void main() {
  testWidgets('ArticleListScreen widget test', (WidgetTester tester) async {
    final mockViewModel = MockArticleListViewModel();

    when(mockViewModel.fetchArticles()).thenAnswer((_) => Future.value());

    await tester.pumpWidget(
      MultiProvider(
        providers: [
          ChangeNotifierProvider<ArticleListViewModel>.value(
            value: mockViewModel,
          ),
        ],
        child: MaterialApp(
          home: ArticleListScreen(
            viewModel: mockViewModel,
          ),
        ),
      ),
    );

    expect(find.byType(AppBar), findsOneWidget);
    await tester.pumpAndSettle(Duration(seconds: 1));
    await tester.runAsync(() async {
      await mockViewModel.fetchArticles();
      expect(find.byType(CircularProgressIndicator), findsNothing);
      expect(find.byType(ListView), findsWidgets);
    });
  });
}
