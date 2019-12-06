class TvModel {
  int page;
  int total_pages;
  int total_results;

  var result = [];

  TvModel.fromJson(Map<String, dynamic> parsedJson) {
    page = parsedJson['page'];
    total_results = parsedJson['total_results'];
    total_pages = parsedJson['total_pages'];
    List<ResultSer> temp = [];

    for (var i = 0; i < parsedJson['results'].length; i++) {
      ResultSer result = new ResultSer(parsedJson['results'][i]);
      temp.add(result);
    }

    
    result = temp;
  }
}

class ResultSer {
  String original_name;
  List<int> genre_ids = [];
  String name;
  String popularity;
  List<String> origin_country = [];
  int vote_count;
  int id;
  String first_air_date;
  String backdrop_path;
  String original_language;
  var vote_average;
  String overview;
  String poster_path;

  ResultSer(result) {
    original_name = result['original_name'].toString();
    for (var i = 0; i < result['genre_ids'].length; i++) {
      genre_ids.add(result['genre_ids'][i]);
    }
    name = result['name'].toString();
    popularity = result['popularity'].toString();
    for (var i = 0; i < result['origin_country'].length; i++) {
      origin_country.add(result['origin_country'][i]);
    }
    vote_count = result['vote_count'];
    first_air_date = result['first_air_date'].toString();
    backdrop_path =
        'http://image.tmdb.org/t/p/w200//' + result['backdrop_path'].toString();
    original_language = result['original_language'].toString();
    id = result['id'];
    vote_average = result['vote_average'].toString();
    overview = result['overview'].toString();
    poster_path =
        'http://image.tmdb.org/t/p/w200//' + result['poster_path'].toString();
  }

  String get getOriginalName => original_name;
  List<int> get getGenre => genre_ids = [];
  String get getName => name;
  String get getPopularity => popularity;
  int get getVoteCount => vote_count;
  String get getFirstDate => first_air_date;
  String get getBackdropPath => backdrop_path;
  String get getOriginalLang => original_language;
  int get getID => id;
  String get getVoteAverage => vote_average;
  String get getPosterPath => poster_path;
  String get getOverview => overview;
}
