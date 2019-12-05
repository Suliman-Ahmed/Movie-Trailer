class ItemModel {
  int page;
  int total_pages;
  int total_results;

  var result = [];

  ItemModel.fromJson(Map<String, dynamic> parsedJson, bool isRecent) {
    page = parsedJson['page'];
    total_results = parsedJson['total_results'];
    total_pages = parsedJson['total_pages'];
    List<Result> temp = [];

    for (var i = 0; i < parsedJson['results'].length; i++) {
      Result result = new Result(parsedJson['results'][i]);
      temp.add(result);
    }

    if (!isRecent) {
      temp.sort((a, b) {
        return a.popularity.compareTo(b.popularity);
      });
    }else{
      temp.sort((a, b) {
        return DateTime.parse(a.release_date).compareTo( DateTime.parse(b.release_date));
      });
    }

    result = temp;
  }
}

class Result {
  int key;
  String vote_count;
  int id;
  bool video;
  var vote_average;
  String title;
  String popularity;
  String poster_path;
  List<int> genre_ids = [];
  String backdrop_path;
  bool adult;
  String overview;
  String release_date;

  Result(result) {
    vote_count = result['vote_count'].toString();
    id = result['id'];
    video = result['video'];
    key = result['key'];

    video = result['video'];
    vote_average = result['vote_average'].toString();
    title = result['title'].toString();
    popularity = result['popularity'].toString();
    poster_path =
        'http://image.tmdb.org/t/p/w200//' + result['poster_path'].toString();
    for (var i = 0; i < result['genre_ids'].length; i++) {
      genre_ids.add(result['genre_ids'][i]);
    }
    backdrop_path = result['backdrop_path'].toString();
    adult = result['adult'];
    overview = result['overview'].toString();
    release_date = result['release_date'].toString();
  }

  String get getVoteCount => vote_count;
  int get getID => id;
  bool get istVideo => video;
  String get getVoteAverage => vote_average;
  int get getKey => key;
  String get getTitile => title;
  String get getPopularity => popularity;
  String get getPosterPath => poster_path;
  List<int> get getGenre => genre_ids = [];
  String get gatBackdropPath => backdrop_path;
  bool get getAdult => adult;
  String get getOverview => overview;
  String get getRelaseDate => release_date;
}
