import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:newsappmad/models/show_category.dart';

class ShowCategoryNews {
  List<ShowCategoryModel> categories = [];

  Future<void> getCategoriesNews(String category) async {
    String url =
        "https://newsapi.org/v2/top-headlines?country=us&category=$category&apiKey=0722b9455c4e425b9a9be7236f09ce34";

    try {
      // Fetching data from the API
      var response = await http.get(Uri.parse(url));

      if (response.statusCode == 200) {
        var jsonData = jsonDecode(response.body);

        if (jsonData['status'] == 'ok' && jsonData['articles'] != null) {
          // Parsing articles from JSON data
          jsonData["articles"].forEach((element) {
            if (element["urlToImage"] != null &&
                element["description"] != null) {
              ShowCategoryModel categoryModel = ShowCategoryModel(
                title: element["title"] ?? "No Title", // Added null safety
                description: element["description"] ?? "No Description",
                url: element["url"] ?? "",
                urlToImage: element["urlToImage"] ?? "",
                content: element["content"] ?? "No Content",
                author: element["author"] ?? "Unknown Author",
              );
              categories.add(categoryModel); // Add to categories list
            }
          });
        } else {
          print("Error: Unexpected JSON format or missing 'articles' key");
        }
      } else {
        print(
            "Error: Failed to fetch data (Status Code: ${response.statusCode})");
      }
    } catch (e) {
      print("Error: $e");
    }
  }
}
