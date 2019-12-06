import 'dart:convert';

import 'package:flutter_movie_trailer/models/tv_item_model.dart';
import 'package:http/http.dart' show Client;
import 'package:http/http.dart';

class TvProvider {
  Client client = new Client();
  final apikey = "ee3c37eddb9e95c458322266fe5fa346";
  final baseURL = "https://api.themoviedb.org/3/";

  Future<TvModel> fetchPopularTVSeries() async {
    print('All Series');

      final response = await client.get(
          baseURL+'tv/popular?api_key=$apikey');
      if (response.statusCode == 200) {
        print(response.body.toString());
        print('Series Success');
        return TvModel.fromJson(jsonDecode(response.body));
      } else {
        throw Exception('Faild to load the page');
      }
    
  }

}
