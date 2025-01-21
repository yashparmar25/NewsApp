import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:newsappmad/models/article_model.dart';

class News {
  List<ArticleModel> news = [];

  Future<void> getNews() async {
    String url =
        "https://newsapi.org/v2/top-headlines?country=us&category=business&apiKey=0722b9455c4e425b9a9be7236f09ce34";

    var responce = await http.get(Uri.parse(url));

    var jsonData = jsonDecode(responce.body);

    if (jsonData['status'] == 'ok') {
      jsonData["articles"].forEach((element) {
        if (element["urlToImage"] != null && element["description"] != null) {
          ArticleModel articleModel = ArticleModel(
            title: element["title"], // Corrected from "tile" to "title"
            description: element["description"],
            url: element["url"],
            urlToImage: element["urlToImage"],
            content: element["content"],
            author: element["author"],
          );
          news.add(articleModel);
        }
      });
    }
  }
}
