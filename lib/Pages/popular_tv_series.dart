import 'package:flutter/material.dart';
import 'package:flutter_movie_trailer/blocks/genre_tv_bloc.dart';
import 'package:flutter_movie_trailer/blocks/tv_bloc.dart';
import 'package:flutter_movie_trailer/models/genre_model.dart';
import 'package:flutter_movie_trailer/models/tv_item_model.dart';
import 'package:flutter_movie_trailer/ui/colors.dart';

class PopularSeries extends StatefulWidget {
  AsyncSnapshot<GenreModel> snapshotGenre;
  PopularSeries(this.snapshotGenre);
  @override
  _PopularSeriesState createState() => _PopularSeriesState();
}

class _PopularSeriesState extends State<PopularSeries> {
  @override
  Widget build(BuildContext context) {
    blocTvGenre.fetchAllTvGenre();
    return StreamBuilder(
      stream: blocTvGenre.allGen,
      builder: (context, AsyncSnapshot<GenreModel> snapshot) {
        if (snapshot.hasData) {
          return Container(
            margin: EdgeInsets.only(top: 20),
            width: MediaQuery.of(context).size.width - 20,
            height: 350,
            child: GenreItemsLoad(widget.snapshotGenre),
          );
        } else if (snapshot.hasError) {
          return Text(snapshot.error.toString());
        }
        return Center(child: CircularProgressIndicator());
      },
    );
  }
}

class GenreItemsLoad extends StatefulWidget {
  AsyncSnapshot<GenreModel> snapshotGenre;
  GenreItemsLoad(this.snapshotGenre);
  @override
  _GenreItemsLoadState createState() => _GenreItemsLoadState();
}

class _GenreItemsLoadState extends State<GenreItemsLoad> {
  @override
  Widget build(BuildContext context) {
    tvBloc.fetchAllPopularSeries();
    return StreamBuilder(
      stream: tvBloc.getAllPopularSeries,
      builder: (context, AsyncSnapshot<TvModel> snapshot) {
        if (snapshot.hasData) {
          return Container(
            margin: EdgeInsets.only(top: 20),
            width: MediaQuery.of(context).size.width - 20,
            height: 350,
            child: ItemsLoad(snapshot, widget.snapshotGenre),
          );
        } else if (snapshot.hasError) {
          return Text(snapshot.error.toString());
        }
        return Center(child: CircularProgressIndicator());
      },
    );
  }
}

class ItemsLoad extends StatefulWidget {
  AsyncSnapshot<TvModel> snapshot;
  AsyncSnapshot<GenreModel> snapshotGene;
  ItemsLoad(this.snapshot, this.snapshotGene);
  @override
  _ItemLoadState createState() => _ItemLoadState();
}

class _ItemLoadState extends State<ItemsLoad> {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      scrollDirection: Axis.horizontal,
      itemCount: 5,
      itemBuilder: (context, int index) {
        return Column(
          children: <Widget>[
            InkWell(
              child: Row(
                children: <Widget>[
                  Container(
                    margin: EdgeInsets.only(left: 6, right: 15, top: 10),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(5),
                      child: Image.network(
                          widget.snapshot.data.result[index].poster_path),
                    ),
                  ),
                  Container(
                    width: MediaQuery.of(context).size.width - 20 - 200,
                    height: 300,
                    padding: EdgeInsets.only(
                        top: 30, left: 10, right: 10, bottom: 30),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisSize: MainAxisSize.max,
                      children: <Widget>[
                        Text(
                          widget.snapshot.data.result[index].name,
                          style: TextStyle(fontSize: 20, color: Colors.white),
                        ),
                        Padding(
                          padding: EdgeInsets.only(top: 8),
                        ),
                        Container(
                          child: Text(
                            widget.snapshot.data.result[index].first_air_date,
                            style: TextStyle(color: Colors.white),
                          ),
                        ),
                        Text(
                          widget.snapshotGene.data.getGenre(widget.snapshot.data.result[index].genre_ids),
                          style: TextStyle(color: textColor),
                        ),
                        Padding(
                          padding: EdgeInsets.only(top: 9),
                        ),
                        Row(
                          children: <Widget>[
                            Icon(
                              Icons.star,
                              color: iconColor,
                              size: 25,
                            ),
                            RichText(
                                text: TextSpan(
                                    text: widget.snapshot.data.result[index]
                                        .vote_average,
                                    style: TextStyle(
                                        fontSize: 21,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.white),
                                    children: <TextSpan>[
                                  TextSpan(
                                      text: '/10',
                                      style: TextStyle(
                                          fontSize: 16,
                                          fontWeight: FontWeight.bold,
                                          color: Colors.white)),
                                ]))
                          ],
                        ),
                      ],
                    ),
                  )
                ],
              ),
            )
          ],
        );
      },
    );
  }
}
