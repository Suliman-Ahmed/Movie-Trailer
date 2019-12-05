import 'package:flutter/material.dart';
import 'package:flutter_movie_trailer/Pages/all_movie.dart';
import 'package:flutter_movie_trailer/ui/movie_details.dart';

import 'colors.dart';

class Recent extends StatelessWidget {
  String name;
  Recent(this.name);
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
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => ShowAllMovie()));
              },
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
}
