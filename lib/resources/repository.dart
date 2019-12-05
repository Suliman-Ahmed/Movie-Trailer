import 'package:flutter_movie_trailer/models/genre_model.dart';
import 'package:flutter_movie_trailer/models/item_model.dart';
import 'package:flutter_movie_trailer/models/tailer_model.dart';
import 'package:flutter_movie_trailer/resources/movie_api_provider.dart';

class Repository{
  final movieApiProvider = new MovieApiProvider();

  Future<ItemModel> fetchAllMovie() async => movieApiProvider.fetchMovieList(0);
  Future<ItemModel> fetchPopularMovies() async => movieApiProvider.fetchPopularMovieList(1);
  Future<ItemModel> fetchAllUpcoming() async => movieApiProvider.fetchUpcomingMovies(2);
  Future<GenreModel> fetchGenre() async => movieApiProvider.fetchGenreList();
  Future<TrailerModel> fetchAllTrailrs(int movieID) async => movieApiProvider.fetchTrailers(movieID);
}