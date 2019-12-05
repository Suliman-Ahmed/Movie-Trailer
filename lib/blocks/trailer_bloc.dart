import 'package:flutter_movie_trailer/models/tailer_model.dart';
import 'package:flutter_movie_trailer/resources/repository.dart';
import 'package:rxdart/rxdart.dart';

class TrailerBloc {
  final repository = Repository();
  final trailerFetcher = PublishSubject<TrailerModel>();

  Observable<TrailerModel> get allTrailersOfMovie => trailerFetcher.stream;

  fetchAllTrailers2(int movieId) async {
    TrailerModel trailerModel = await  repository.fetchAllTrailrs(movieId);
    trailerFetcher.sink.add(trailerModel);
  }

  void dispose() {
    trailerFetcher.close();
  }
}

final blocTrailer = TrailerBloc();
