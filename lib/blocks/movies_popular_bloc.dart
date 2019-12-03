import 'package:flutter_movie_trailer/models/item_model.dart';
import 'package:flutter_movie_trailer/resources/repository.dart';
import 'package:rxdart/rxdart.dart';

class MovieBlock{
  final repository = Repository();
  final movieFetcher = PublishSubject<ItemModel>();

  Observable<ItemModel> get getAllPopularMovies => movieFetcher.stream;

  fetchAllPopularMovie() async {
    ItemModel itemModel = await repository.fetchPopularMovies();
    movieFetcher.sink.add(itemModel);
  }

  dispose(){
    movieFetcher.close();
  }
}

final blocPopular = MovieBlock();