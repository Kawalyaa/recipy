import 'package:http/http.dart';

const String apiKey = 'ebbf9e63727e3ab36af9fd3f589e9360';
const String apiId = '9d539e73';
const String apiUrl = 'https://api.edamam.com/search';

class RecipeServices {
  Future getData(String url) async {
    print('Calling url $url');
    final response = await get(Uri.parse(url));
    if (response.statusCode == 200) {
      return response.body;
    } else {
      print(response.statusCode);
    }
  }

  Future<dynamic> getRecipes(String query, int from, int to) async {
    // 2
    final recipeData = await getData(
        '$apiUrl?app_id=$apiId&app_key=$apiKey&q=$query&from=$from&to=$to');
    return recipeData;
  }
}
