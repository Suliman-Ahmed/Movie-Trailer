import 'package:flutter_movie_trailer/models/item_model.dart';
import 'package:flutter_movie_trailer/resources/repository.dart';
import 'package:rxdart/rxdart.dart';

class MovieBlock{
  final repository = Repository();
  final movieFetcher = PublishSubject<ItemModel>();

  Observable<ItemModel> get allMovies => movieFetcher.stream;

  fetchAllMovie() async {
    ItemModel itemModel = await repository.fetchAllMovie();
    movieFetcher.sink.add(itemModel);
  }

  dispose(){
    movieFetcher.close();
  }
}

final bloc = MovieBlock();