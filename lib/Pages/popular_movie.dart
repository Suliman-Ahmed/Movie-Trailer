import 'package:flutter/material.dart';
import 'package:flutter_movie_trailer/blocks/movies_popular_bloc.dart';
import 'package:flutter_movie_trailer/models/genre_model.dart';
import 'package:flutter_movie_trailer/models/item_model.dart';
import 'package:flutter_movie_trailer/ui/colors.dart';
import 'package:flutter_movie_trailer/ui/movie_details.dart';

class PopularMovies extends StatefulWidget {
  AsyncSnapshot<GenreModel> snapshotGenre;
  PopularMovies(this.snapshotGenre);
  @override
  _PopularMoviesState createState() => _PopularMoviesState();
}

class _PopularMoviesState extends State<PopularMovies> {
  @override
  Widget build(BuildContext context) {
    blocPopular.fetchAllPopularMovie();
    return StreamBuilder(
      stream: blocPopular.getAllPopularMovies,
      builder: (context, AsyncSnapshot<ItemModel> snapshot) {
        if (snapshot.hasData) {
          return Container(
            margin: EdgeInsets.only(top: 20),
            width: MediaQuery.of(context).size.width - 20,
            height: 350,
            child: ItemsPopularLoad(snapshot, widget.snapshotGenre),
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

class ItemsPopularLoad extends StatefulWidget {
  AsyncSnapshot<ItemModel> snapshot;
  AsyncSnapshot<GenreModel> snapshotGene;
  ItemsPopularLoad(this.snapshot, this.snapshotGene);
  @override
  _ItemsPopularLoadState createState() => _ItemsPopularLoadState();
}

class _ItemsPopularLoadState extends State<ItemsPopularLoad> {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      scrollDirection: Axis.horizontal,
      itemCount: 5,
      itemBuilder: (context, int index) {
        String genres = widget.snapshotGene.data
            .getGenre(widget.snapshot.data.result[index].genre_ids);
        return Column(
          children: <Widget>[
            InkWell(
              onTap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => MovieDetail(widget.snapshot.data.result[index],genres)));
              },
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
                    padding:
                        EdgeInsets.only(top: 30, left: 10, right: 10, bottom: 30),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisSize: MainAxisSize.max,
                      children: <Widget>[
                        Text(
                          widget.snapshot.data.result[index].title,
                          style: TextStyle(fontSize: 20, color: Colors.white),
                        ),
                        Padding(
                          padding: EdgeInsets.only(top: 8),
                        ),
                        Text(
                          widget.snapshot.data.result[index].release_date,
                          style: TextStyle(color: Colors.white),
                        ),
                        Text(
                          genres,
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
                                    text: widget
                                        .snapshot.data.result[index].vote_average,
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
