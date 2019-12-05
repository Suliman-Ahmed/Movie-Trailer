import 'package:flutter/material.dart';
import 'package:flutter_movie_trailer/ui/colors.dart';

class ShowAllMovie extends StatefulWidget {
  @override
  _ShowAllMovieState createState() => _ShowAllMovieState();
}

class _ShowAllMovieState extends State<ShowAllMovie> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: bgColor,
      appBar: AppBar(
        title: Text('All Movies'),
        centerTitle: true,
        backgroundColor: bgColor,
      ),
      body: Container(
        
      ),
    );
  }
}