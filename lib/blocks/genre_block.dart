import 'package:flutter_movie_trailer/models/genre_model.dart';
import 'package:flutter_movie_trailer/resources/repository.dart';
import 'package:rxdart/rxdart.dart';

class GenreBlock{
  final repository = Repository();
  final movieFetcher = PublishSubject<GenreModel>();

  Observable<GenreModel> get allMovies => movieFetcher.stream;

  fetchAllGenre() async {
    GenreModel itemModel = await repository.fetchGenre();
    movieFetcher.sink.add(itemModel);
  }

  dispose(){
    movieFetcher.close();
  }
}

final blocGenre = GenreBlock();