import 'package:flutter/material.dart';
import 'package:flutter_movie_trailer/models/genre_model.dart';
import 'package:flutter_movie_trailer/models/item_model.dart';
import 'package:flutter_movie_trailer/ui/colors.dart';
import 'package:flutter_movie_trailer/ui/movie_details.dart';

class ItemsLoad extends StatefulWidget {
  AsyncSnapshot<ItemModel> snapshot;
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
        
        String genres = widget.snapshotGene.data
            .getGenre(widget.snapshot.data.result[index].genre_ids);
        return Row(
          children: <Widget>[
            InkWell(
              onTap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => MovieDetail(widget.snapshot.data.result[index],genres)));
              },
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
                      '${widget.snapshot.data.result[index].title}',
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
