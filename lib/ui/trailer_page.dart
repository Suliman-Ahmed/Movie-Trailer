import 'package:flutter/material.dart';
import 'package:flutter_movie_trailer/models/tailer_model.dart';

class TrailerPage extends StatefulWidget {
  AsyncSnapshot<TrailerModel> snapshot;
  TrailerPage(this.snapshot);
  @override
  _TrailerPageState createState() => _TrailerPageState();
}

class _TrailerPageState extends State<TrailerPage> {
  @override
  Widget build(BuildContext context) {
    double itemWidth = (MediaQuery.of(context).size.width) / 2;
    return Container();
  }

}