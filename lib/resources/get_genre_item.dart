
import 'package:flutter/material.dart';
import 'package:flutter_movie_trailer/ui/colors.dart';

class GetGenreItems extends StatefulWidget {
  String genres;
  GetGenreItems(this.genres);
  @override
  _GetGenreItemsState createState() => _GetGenreItemsState();
}

class _GetGenreItemsState extends State<GetGenreItems> {
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: _getGeres(widget.genres),
      builder: (BuildContext context, AsyncSnapshot snapshot) {
        switch (snapshot.connectionState) {
          case ConnectionState.none:
          case ConnectionState.waiting:
            return Container();
          default:
            if (snapshot.hasError) {
              return Text('ERROR ${snapshot.error}');
            } else {
              return createGenre(snapshot);
            }
        }
      },
    );
  }

  Widget GenreItem(String gene) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: <Widget>[
        Container(
            decoration: BoxDecoration(
                border: Border.all(color: whiteColor),
                borderRadius: BorderRadius.circular(5)),
            child: Padding(
              padding: EdgeInsets.only(left: 10, right: 10, top: 6, bottom: 6),
              child: Text(
                gene,
                style: TextStyle(color: whiteColor, fontSize: 18),
              ),
            ))
      ],
    );
  }

  Future<List<Widget>> _getGeres(String genre) async {
    var values = new List<Widget>();
    var items = genre.split(',');
    for (var i = 0; i < items.length; i++) {
      values.add(GenreItem(items[i]));
      if (i != items.length - 1) {
        values.add(SizedBox(
          width: 4,
        ));
      }
    }

    await new Future.delayed(Duration(milliseconds: 400));
    return values;
  }

  Widget createGenre(AsyncSnapshot snapshot) {
    List<Widget> values = snapshot.data;
    return Container(
      width: MediaQuery.of(context).size.width,
      child: Wrap(
        direction: Axis.horizontal,
        crossAxisAlignment: WrapCrossAlignment.start,
        runSpacing: 4,
        spacing: 4,
        children: values,
      ),
    );
  }
}
