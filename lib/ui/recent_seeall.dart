import 'package:flutter/material.dart';
import 'package:flutter_movie_trailer/Pages/all_movies.dart';
import 'package:flutter_movie_trailer/Pages/all_popular_movie.dart';
import 'package:flutter_movie_trailer/Pages/all_tv_series.dart';
import 'package:flutter_movie_trailer/Pages/all_upcaming.dart';
import 'package:flutter_movie_trailer/models/genre_model.dart';

import 'colors.dart';

class Recent extends StatelessWidget {
  AsyncSnapshot<GenreModel> snapshotGenre;
  String pageName;
  String name;
  Recent(this.name, this.pageName, this.snapshotGenre);
  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: 28,
      child: Stack(
        children: <Widget>[
          Positioned(
            top: 3,
            child: Text(
              '$name',
              style: TextStyle(
                  fontSize: 20,
                  color: Colors.white,
                  fontWeight: FontWeight.bold),
            ),
          ),
          Positioned(
            top: 3,
            right: 20,
            child: InkWell(
              onTap: () => navigate(context),
              child: Text(
                'See all',
                style: TextStyle(
                  fontSize: 20,
                  color: textColor,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  void navigate(BuildContext context) {
    {
      switch (pageName) {
        case 'Popular':
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => ShowAllPopularMovie(snapshotGenre)));
          break;
        case 'Now Playing':
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => ShowAllMovie(snapshotGenre)));
          break;
        case 'Upcaming':
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => ShowAllUpcomingMovie(snapshotGenre)));
          break;
        case 'Popular Series':
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => ShowAllSeries(snapshotGenre)));
          break;
      }
    }
  }
}
