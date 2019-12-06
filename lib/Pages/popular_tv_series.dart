import 'package:flutter/material.dart';
import 'package:flutter_movie_trailer/blocks/tv_bloc.dart';
import 'package:flutter_movie_trailer/models/genre_model.dart';
import 'package:flutter_movie_trailer/models/tv_item_model.dart';
import 'package:flutter_movie_trailer/ui/colors.dart';
import 'package:flutter_movie_trailer/ui/movie_details.dart';

class PopularSeries extends StatefulWidget {
  AsyncSnapshot<GenreModel> snapshotGenre;
  PopularSeries(this.snapshotGenre);
  @override
  _PopularSeriesState createState() => _PopularSeriesState();
}

class _PopularSeriesState extends State<PopularSeries> {
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

  ItemsLoad(this.snapshot,this.snapshotGene);
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
        
        return Row(
          children: <Widget>[
            InkWell(
              child: ConstrainedBox(
                constraints: BoxConstraints(
                    minHeight: 300.0,
                    minWidth: MediaQuery.of(context).size.width * 0.40,
                    maxHeight: 300.0,
                    maxWidth: MediaQuery.of(context).size.width * 0.40),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.max,
                  children: <Widget>[
                    Stack(
                      alignment: Alignment.bottomRight,
                      children: <Widget>[
                        ClipRRect(
                          borderRadius: BorderRadius.circular(5),
                          child: Image.network(
                              widget.snapshot.data.result[index].poster_path),
                        ),
                        Row(
                          children: <Widget>[
                            Icon(
                              Icons.star,
                              color: iconColor,
                            ),
                            Text(
                                '${widget.snapshot.data.result[index].vote_average}',
                                style: TextStyle(
                                    color: Colors.white, fontSize: 16))
                          ],
                        )
                      ],
                    ),
                    SizedBox(
                      height: 6,
                    ),
                    Text(
                      '${widget.snapshot.data.result[index].name}',
                      style: TextStyle(color: Colors.white, fontSize: 16),
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(
              width: 10,
            )
          ],
        );
      },
    );
  }
}
