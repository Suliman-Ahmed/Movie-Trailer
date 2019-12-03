
import 'package:flutter/material.dart';
import 'package:flutter_movie_trailer/blocks/movies_block.dart';
import 'package:flutter_movie_trailer/models/genre_model.dart';
import 'package:flutter_movie_trailer/models/item_model.dart';
import 'package:flutter_movie_trailer/resources/item_load.dart';

class RecentMovies extends StatefulWidget {
  AsyncSnapshot<GenreModel> snapshotGene;
  RecentMovies(this.snapshotGene);
  @override
  State<StatefulWidget> createState() {
    return _RecentMoviesState();
  }
}

class _RecentMoviesState extends State<RecentMovies> {
  @override
  Widget build(BuildContext context) {
    bloc.fetchAllMovie();
    return StreamBuilder(
      stream: bloc.allMovies,
      builder: (context, AsyncSnapshot<ItemModel> snapshot) {
        if (snapshot.hasData) {
          return Container(
            margin: EdgeInsets.only(top: 20),
            width: MediaQuery.of(context).size.width - 20,
            height: 300,
            child: ItemsLoad(snapshot,widget.snapshotGene),
          );
        } else if (snapshot.hasError) {
          return Text(snapshot.error.toString());
        } else {
          return Center(child: CircularProgressIndicator());
        }
      },
    );
  }
}
