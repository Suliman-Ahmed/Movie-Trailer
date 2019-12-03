import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_movie_trailer/blocks/movies_block.dart';
import 'package:flutter_movie_trailer/resources/pre_load.dart';
import 'package:flutter_movie_trailer/ui/colors.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle.light
        .copyWith(statusBarIconBrightness: Brightness.light));
    bloc.fetchAllMovie();
    return Scaffold(
        backgroundColor: bgColor,
        body: Container(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          child: PreloadContant(),
        ));
  }
}
