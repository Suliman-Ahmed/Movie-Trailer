import 'package:flutter_movie_trailer/models/tv_item_model.dart';
import 'package:flutter_movie_trailer/resources/repository.dart';
import 'package:rxdart/rxdart.dart';

class SeriesBloc{
  final repository = Repository();
  final movieFetcher = PublishSubject<TvModel>();

  Observable<TvModel> get getAllPopularSeries => movieFetcher.stream;

  fetchAllPopularSeries() async {
    TvModel itemModel = await repository.fetchAllPopularSeries();
    movieFetcher.sink.add(itemModel);
  }

  dispose(){
    movieFetcher.close();
  }
}

final tvBloc = SeriesBloc();