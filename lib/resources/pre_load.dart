import 'package:flutter/material.dart';
import 'package:flutter_movie_trailer/Pages/content.dart';
import 'package:flutter_movie_trailer/blocks/genre_block.dart';
import 'package:flutter_movie_trailer/blocks/genre_tv_bloc.dart'; 
import 'package:flutter_movie_trailer/models/genre_model.dart';

class PreloadContant extends StatefulWidget {
  @override
  _PreloadContantState createState() => _PreloadContantState();
}

class _PreloadContantState extends State<PreloadContant> {
  @override
  Widget build(BuildContext context) {
    blocGenre.fetchAllGenre();
    
    return StreamBuilder(
      stream: blocGenre.allMovies,
      builder: (context, AsyncSnapshot<GenreModel> snapshot) {
        if (snapshot.hasData) {
          return Content(snapshot);
        } else if (snapshot.hasError) {
          return Text(snapshot.error.toString());
        } else {
          return Center(child: CircularProgressIndicator());
        }
      },
    );
  }
}