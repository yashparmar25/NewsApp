import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:newsappmad/models/slider_model.dart';

class Sliders {
  List<sliderModel> sliders = [];

  Future<void> getSlider() async {
    String url =
        "https://newsapi.org/v2/everything?domains=wsj.com&apiKey=0722b9455c4e425b9a9be7236f09ce34";

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
              sliderModel slidermodel = sliderModel(
                title: element["title"] ?? "No Title", // Added null safety
                description: element["description"] ?? "No Description",
                url: element["url"] ?? "",
                urlToImage: element["urlToImage"] ?? "",
                content: element["content"] ?? "No Content",
                author: element["author"] ?? "Unknown Author",
              );
              sliders.add(slidermodel);
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
