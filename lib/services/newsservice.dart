import 'package:http/http.dart' as http;
import 'dart:convert';

import '../data/newsarticle.dart';

class NewsService {
  final String apiKey = 'qRNaKV8Nl45NfDLH1AP7UNCb5vIGHKSU';
  final String baseUrl = 'https://api.nytimes.com/svc/mostpopular/v2/viewed/';

  Future<List<NewsArticle>> fetchMostPopularArticles() async {
    final response =
        await http.get(Uri.parse('$baseUrl/7.json?api-key=$apiKey'));

    if (response.statusCode == 200) {
      // Parse the JSON response and return a list of NewsArticle objects
      // You can use the `json` package or a code generation library like `json_serializable`
      try {
        final jsonBody = json.decode(response.body);
        if (jsonBody['status'] == 'OK') {
          final articlesJson = jsonBody['results'] as List<dynamic>;

          final articles = articlesJson.map((json) {
            final media = json['media'] as List<dynamic>?;
            final mediaMetadata = media != null && media.isNotEmpty
                ? media[0]['media-metadata'] as List<dynamic>?
                : null;

            String imageUrl = '';
            if (mediaMetadata != null && mediaMetadata.isNotEmpty) {
              final urlData = mediaMetadata[0];
              if (urlData.containsKey('url')) {
                imageUrl = urlData['url'] as String;
              }
            } else {
              // Set placeholder image URL when media is empty or null
              imageUrl = 'https://placehold.co/600x400.png';
            }

            return NewsArticle(
              title: json['title'] as String,
              snippet: json['abstract'] as String,
              imageUrl: imageUrl,
              writer: json['byline'] as String,
              date: json['published_date'] as String
            );
          }).toList();

          return articles;
        } else {
          throw Exception('API request failed');
        }
      } catch (e) {
        print('Error parsing JSON: $e');
        throw Exception('Failed to parse articles');
      }
    } else {
      throw Exception('Failed to fetch articles');
    }
  }
}
