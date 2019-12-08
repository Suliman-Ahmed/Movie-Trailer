import 'dart:convert';

import 'package:flutter_movie_trailer/models/genre_model.dart';
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
        print('Series Success');
        return TvModel.fromJson(jsonDecode(response.body));
      } else {
        throw Exception('Faild to load the page');
      }
    
  }



  Future<GenreModel> fetchTvGenreList() async {
    print('Enterd Gen');
    try {
      final response = await client.get(
          baseURL+'genre/tv/list?api_key=$apikey');
      if (response.statusCode == 200) {
        print(response.body.toString());
        print('AE');
        return GenreModel.fromJson(jsonDecode(response.body));
      } else {
        throw Exception('Faild to load the page');
      }
    } catch (e) {
      return e;
    }
  } 


}
