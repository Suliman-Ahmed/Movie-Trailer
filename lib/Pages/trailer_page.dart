import 'package:flutter/material.dart';
import 'package:flutter_movie_trailer/models/tailer_model.dart';
import 'package:flutter_movie_trailer/ui/colors.dart';
import 'package:url_launcher/url_launcher.dart';

class TrailerPage extends StatefulWidget {
  AsyncSnapshot<TrailerModel> snapshot;
  String backPost;
  TrailerPage(this.snapshot,this.backPost);
  @override
  _TrailerPageState createState() => _TrailerPageState();
}

class _TrailerPageState extends State<TrailerPage> {
  @override
  Widget build(BuildContext context) {
    double itemWidth = (MediaQuery.of(context).size.width -16) / 2;
    return GridView.count(
      padding: EdgeInsets.all(10),
      crossAxisCount: 2,
      childAspectRatio: (itemWidth / 155),
      crossAxisSpacing: 16,
      mainAxisSpacing: 16,
      physics: NeverScrollableScrollPhysics(),
      children:
          List<Widget>.generate(widget.snapshot.data.results.length, (index) {
        return GridTile(
          child: InkWell(
            onTap: () {
              _launchURL('https://www.youtube.com/watch?v=' +
                  widget.snapshot.data.results[index].key);
            },
            child: Container(
              height: 400,
              width: MediaQuery.of(context).size.width,
              child: InkWell(
                onTap: () {
                  _launchURL('https://www.youtube.com/watch?v=' +
                      widget.snapshot.data.results[index].key);
                },
                child: Wrap(
                  children: <Widget>[
                    Container(
                      margin: EdgeInsets.only(bottom: 5),
                      child: Stack(
                        children: <Widget>[
                          Image.network('${widget.backPost}'),
                          Container(
                            width: itemWidth,
                            height: 90,
                            color: Colors.black38,
                          ),
                          Positioned(
                            top: 36,
                            left: (itemWidth -16 -36) / 2,
                            child: Icon(Icons.play_circle_filled,size:36,color:whiteColor),
                          )
                        ],
                      ),
                    ),
                    Text(
                      widget.snapshot.data.results[index].name,
                      style: TextStyle(color: whiteColor),
                    )
                  ],
                ),
              ),
            ),
          ),
        );
      }),
    );
  }
}

_launchURL(String _url) async {
  if (await canLaunch(_url)) {
    await launch(_url);
  } else {
    throw 'Could not launch $_url';
  }
}
