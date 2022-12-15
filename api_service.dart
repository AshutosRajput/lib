import 'dart:async';
import 'dart:convert';

import 'package:http/http.dart' as http;

import 'article_model.dart';

Future<Article> fetchArticle() async {
  final Response = await http.get(Uri.parse(
      'https://newsapi.org/v2/everything?q=tesla&from=2022-11-15&sortBy=publishedAt&apiKey=7d16ef8d71b44a9d91b233c0aadad041'));

  if (Response.statusCode == 200) {
    return Article.fromJson(jsonDecode(Response.body));
  } else {
    throw Exception('Failde to load Article');
  }
}
