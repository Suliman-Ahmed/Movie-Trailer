import 'package:flutter/material.dart';
import 'package:flutter_movie_trailer/blocks/trailer_bloc.dart';
import 'package:flutter_movie_trailer/models/item_model.dart';
import 'package:flutter_movie_trailer/models/tailer_model.dart';
import 'package:flutter_movie_trailer/resources/get_genre_item.dart';
import 'package:flutter_movie_trailer/ui/colors.dart';
import 'package:flutter_movie_trailer/ui/trailer_page.dart';

class MovieDetail extends StatefulWidget {
  Result data;
  String genres;
  MovieDetail(this.data, this.genres);
  @override
  _MovieDetailState createState() => _MovieDetailState();
}

class _MovieDetailState extends State<MovieDetail> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ContentPage(widget.data, widget.genres),
    );
  }
}

class ContentPage extends StatefulWidget {
  Result data;
  String genres;
  ContentPage(this.data, this.genres);
  @override
  _ContentPageState createState() => _ContentPageState();
}

class _ContentPageState extends State<ContentPage> {
  @override
  Widget build(BuildContext context) {
    double _width = MediaQuery.of(context).size.width;

    return Container(
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height,
      color: bgColor,
      child: Stack(
        children: <Widget>[
          Container(
              height: 340,
              decoration: BoxDecoration(
                image: DecorationImage(
                    fit: BoxFit.fitWidth,
                    alignment: FractionalOffset.topCenter,
                    image: NetworkImage(
                      widget.data.poster_path.replaceAll('w185', 'w400'),
                    )),
              )),
          //Gradent
          Positioned(
              top: 220,
              child: Container(
                margin: EdgeInsets.only(),
                width: _width,
                height: 120,
                decoration: BoxDecoration(
                    gradient: LinearGradient(stops: [
                  0.1,
                  0.3,
                  0.5,
                  0.7,
                  0.9
                ], colors: [
                  bgColor.withOpacity(0.01),
                  bgColor.withOpacity(0.25),
                  bgColor.withOpacity(0.7),
                  bgColor.withOpacity(0.9),
                  bgColor
                ], begin: Alignment.topCenter, end: Alignment.bottomCenter)),
              )),
          //Movie Name
          Positioned(
            top: 240,
            left: 20,
            child: Container(
              width: _width,
              child: Text(
                widget.data.title,
                style: TextStyle(color: whiteColor, fontSize: 20),
              ),
            ),
          ),
          //Movie Genre
          Positioned(
            top: 295,
            left: 10,
            child: GetGenreItems(widget.genres),
          ),
          Positioned(
            left: 20,
            right: 20,
            top: 360,
            child: Container(
              width: _width,
              height: 0.5,
              color: textColor,
            ),
          ),
          Positioned(
            top: 372,
            child: Container(
                width: _width,
                height: MediaQuery.of(context).size.height - 370,
                child: SingleChildScrollView(
                  child: Column(
                    children: <Widget>[
                      // Rating & Vote count and popularity
                      Container(
                        margin: EdgeInsets.only(left: 20),
                        child: Container(
                          margin: EdgeInsets.only(left: 20, right: 20),
                          width: _width - 40,
                          height: 120,
                          child: Column(
                            children: <Widget>[
                              Row(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: <Widget>[
                                  Container(
                                    width: (_width - 80) / 3,
                                    height: 120,
                                    child: Center(
                                      child: Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: <Widget>[
                                          Text(
                                            '${widget.data.popularity}',
                                            style: TextStyle(
                                                color: Colors.greenAccent,
                                                fontSize: 24,
                                                fontWeight: FontWeight.bold),
                                          ),
                                          Text(
                                            'Popularity',
                                            style: TextStyle(
                                                color: whiteColor,
                                                fontSize: 16),
                                          )
                                        ],
                                      ),
                                    ),
                                  ),
                                  Container(
                                    width: (_width - 80) / 3,
                                    height: 120,
                                    child: Center(
                                      child: Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: <Widget>[
                                          Icon(
                                            Icons.star,
                                            size: 35,
                                            color: iconColor,
                                          ),
                                          RichText(
                                              text: TextSpan(
                                                  text:
                                                      widget.data.vote_average,
                                                  style: TextStyle(
                                                      fontSize: 21,
                                                      fontWeight:
                                                          FontWeight.bold,
                                                      color: Colors.white),
                                                  children: <TextSpan>[
                                                TextSpan(
                                                    text: '/10',
                                                    style: TextStyle(
                                                        fontSize: 16,
                                                        fontWeight:
                                                            FontWeight.bold,
                                                        color: Colors.white)),
                                              ]))
                                        ],
                                      ),
                                    ),
                                  ),
                                  Container(
                                    width: (_width - 80) / 3,
                                    height: 120,
                                    child: Center(
                                      child: Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: <Widget>[
                                          Text(
                                            '${widget.data.vote_count}',
                                            style: TextStyle(
                                                color: Colors.blueAccent,
                                                fontSize: 24),
                                          ),
                                          Text(
                                            'Vote Count',
                                            style: TextStyle(
                                                color: whiteColor,
                                                fontSize: 16),
                                          )
                                        ],
                                      ),
                                    ),
                                  )
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                      //////////////////////////////////////////////////////////////////////
                      Container(
                        child: Container(
                          margin: EdgeInsets.only(left: 20),
                          width: _width,
                          height: 0.5,
                          color: textColor,
                        ),
                      ),
                      /////////////////////////////////////////////////////////////////////
                      //Overview
                      Container(
                        child: Container(
                          margin: EdgeInsets.all(20),
                          width: _width,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Text(
                                'Description',
                                style: TextStyle(
                                    color: whiteColor,
                                    fontSize: 24,
                                    fontWeight: FontWeight.bold),
                              ),
                              SizedBox(
                                height: 8,
                              ),
                              Text(
                                '${widget.data.overview}',
                                style:
                                    TextStyle(color: whiteColor, fontSize: 14),
                              )
                            ],
                          ),
                        ),
                      ),
                      ////////////////////////////////////////////////////
                      //Trailers
                      
                    ],
                  ),
                )),
          ),
        ],
      ),
    );
  }
}

class PreloadTraileContent extends StatefulWidget {
  final int movieID;
  PreloadTraileContent(this.movieID);
  @override
  _PreloadTraileContentState createState() => _PreloadTraileContentState();
}

class _PreloadTraileContentState extends State<PreloadTraileContent> {
  @override
  Widget build(BuildContext context) {
    blocTrailer.fetchAllTrailers(widget.movieID);
    return StreamBuilder(
      stream: blocTrailer.allTrailersOfMovie,
      builder: (context, AsyncSnapshot<TrailerModel> snapshotTrailer) {
        if (snapshotTrailer.hasData) {
          if (snapshotTrailer.data.results.length > 0) {
            return TrailerPage(snapshotTrailer);
          } else {
            return Text(
              'Not Found Trailer',
              style: TextStyle(color: whiteColor),
            );
          }
        } else if (snapshotTrailer.hasError) {
          return Text(snapshotTrailer.error.toString());
        }
        return Center(child: CircularProgressIndicator());
      },
    );
  }
}
