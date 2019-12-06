import 'package:flutter/material.dart';
import 'package:flutter_movie_trailer/Pages/popular_movie.dart';
import 'package:flutter_movie_trailer/Pages/popular_tv_series.dart';
import 'package:flutter_movie_trailer/Pages/upcoming_movies.dart';
import 'package:flutter_movie_trailer/models/genre_model.dart';
import 'package:flutter_movie_trailer/ui/colors.dart';
import 'package:flutter_movie_trailer/ui/recent_movie.dart';
import 'package:flutter_movie_trailer/ui/recent_seeall.dart';

class Content extends StatefulWidget {
  AsyncSnapshot<GenreModel> snapshotGene;
  Content(this.snapshotGene);
  @override
  State<StatefulWidget> createState() {
    return _ContantState();
  }
}

class _ContantState extends State<Content> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    print(widget.snapshotGene);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: EdgeInsets.only(left: 20, top: 30),
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        child: ListView(children: <Widget>[
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.max,
            children: <Widget>[
              Text(
                'Search',
                style: TextStyle(
                  fontSize: 26,
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(
                height: 6,
              ),
              TextField(
                style: TextStyle(color: textColor, fontSize: 20),
                decoration: InputDecoration.collapsed(
                  hintText: 'Movies, Actors, Directors ...',
                  hintStyle: TextStyle(color: textColor, fontSize: 18),
                ),
              ),
              SizedBox(
                height: 6,
              ),
              Container(
                width: MediaQuery.of(context).size.width - 30,
                height: 0.5,
                color: textColor,
              ),
              SizedBox(
                height: 6,
              ),
              Recent('Recent','Now Playing',widget.snapshotGene),
              RecentMovies(widget.snapshotGene),
              Recent('Popular Movies','Popular',widget.snapshotGene),
              PopularMovies(widget.snapshotGene),
              Recent('Popular Series','Popular Series',widget.snapshotGene),
              PopularSeries(widget.snapshotGene),
              Recent('Upcoming Movies','Upcaming',widget.snapshotGene),
              UpcomingMovies(widget.snapshotGene),
            ],
          )
        ]));
  }
}
