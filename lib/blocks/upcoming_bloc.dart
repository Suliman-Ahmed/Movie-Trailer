import 'package:flutter_movie_trailer/models/item_model.dart';
import 'package:flutter_movie_trailer/resources/repository.dart';
import 'package:rxdart/rxdart.dart';

class UpcomingBloc{
  final repository = Repository();
  final movieFetcher = PublishSubject<ItemModel>();

  Observable<ItemModel> get getAllUpcomingMovies => movieFetcher.stream;

  fetchUpcomingMovie() async {
    ItemModel itemModel = await repository.fetchAllUpcoming();
    movieFetcher.sink.add(itemModel);
  }

  dispose(){
    movieFetcher.close();
  }
}

final blocUpcoming = UpcomingBloc();