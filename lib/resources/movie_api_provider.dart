import 'dart:convert';

import 'package:flutter_movie_trailer/models/genre_model.dart';
import 'package:flutter_movie_trailer/models/item_model.dart';
import 'package:flutter_movie_trailer/models/tailer_model.dart';
import 'package:http/http.dart' show Client;
import 'package:http/http.dart';

class MovieApiProvider {
  Client client = new Client();
  final apikey = "ee3c37eddb9e95c458322266fe5fa346";
  final baseURL = "https://api.themoviedb.org/3/";

  Future<ItemModel> fetchMovieList(bool isRecent) async {
    print('object');

    try {
      final response = await client.get(
          baseURL+'movie/now_playing?api_key=$apikey');
      if (response.statusCode == 200) {
        print(response.body.toString());
        print('Success');
        return ItemModel.fromJson(jsonDecode(response.body),isRecent);
      } else {
        throw Exception('Faild to load the page');
      }
    } catch (e) {
      return e;
    }
  }

  Future<ItemModel> fetchPopularMovieList(bool isRecent) async {
    print('object');
    try {
      final response = await client.get(
          baseURL+'movie/popular?api_key=$apikey');
      if (response.statusCode == 200) {
        print(response.body.toString());
        print('Success');
        return ItemModel.fromJson(jsonDecode(response.body),isRecent);
      } else {
        throw Exception('Faild to load the page');
      }
    } catch (e) {
      return e;
    }
  }

  Future<GenreModel> fetchGenreList() async {
    print('Enterd Gen');
    try {
      final response = await client.get(
          baseURL+'genre/movie/list?api_key=$apikey');
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


  Future<TrailerModel> fetchTrailers(int movieId) async {
    final response = await client.get(baseURL+'/movie/$movieId/videos?api_key=$apikey');
    print(response.body.toString());
    if (response.statusCode == 200) {
      return TrailerModel.fromJson(json.decode(response.body));
    } else {
      throw Exception('Failed to load genres');
    }
  }
}
