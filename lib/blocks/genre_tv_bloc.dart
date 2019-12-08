import 'package:flutter_movie_trailer/models/genre_model.dart';
import 'package:flutter_movie_trailer/resources/repository.dart';
import 'package:rxdart/rxdart.dart';

class GenreTvBlock{
  final repository = Repository();
  final movieFetcher = PublishSubject<GenreModel>();

  Observable<GenreModel> get allGen => movieFetcher.stream;

  fetchAllTvGenre() async {
    GenreModel itemModel = await repository.fetchTvGenre();
    movieFetcher.sink.add(itemModel);
  }

  dispose(){
    movieFetcher.close();
  }
}

final blocTvGenre = GenreTvBlock();