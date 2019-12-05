class TrailerModel {
  List<ResultsTr> results = [];

  TrailerModel.fromJson(Map<String, dynamic> parsedJson) {
    List<ResultsTr> temp = [];
    for (var i = 0; i < parsedJson['results'].length; i++) {
      ResultsTr result = ResultsTr(parsedJson['results'][i]);
      temp.add(result);
    }

    results = temp;
  }

  List<ResultsTr> get getTrailers => results;
}

class ResultsTr {
  String key;
  String name;

  ResultsTr(result){
    key = result['key'].toString();
    name = result['name'].toString(); 
  }


  String get getKey => key;
  String get getName => name;
}
