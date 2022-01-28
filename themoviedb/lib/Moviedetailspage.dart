import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:themoviedb/Moviedbdescendant.dart';
import 'package:themoviedb/descendants/Movie.dart';

class Moviedetailspage extends StatefulWidget {
  Movie focusedMovie;
  Moviedetailspage({Key? key, required this.focusedMovie}) : super(key: key);

  @override
  _MoviedetailspageState createState() => _MoviedetailspageState();
}

class _MoviedetailspageState extends State<Moviedetailspage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Jose 28/12022"),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          AspectRatio(
            aspectRatio: 16 / 9,
            child: Container(
              decoration: BoxDecoration(
                  shape: BoxShape.rectangle,
                  gradient: LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: [
                      Colors.blue,
                      Colors.blue.shade600,
                    ],
                  )),
              foregroundDecoration: BoxDecoration(
                  image: DecorationImage(
                      fit: BoxFit.cover,
                      image: NetworkImage(Movidedbdescendant.imageurl(
                          widget.focusedMovie.backdrop_path))),
                  color: Colors.transparent,
                  shape: BoxShape.rectangle),
              width: double.infinity,
            ),
          ),
          Container(
            padding: EdgeInsets.only(right: 25, left: 25),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Container(
                  height: 100,
                  alignment: Alignment.center,
                  child: Text(widget.focusedMovie.title),
                ),
                Container(
                  height: 50,
                  child: Text(
                    '${widget.focusedMovie.vote_average.toString()} / 10',
                    textAlign: TextAlign.end,
                  ),
                ),
                Text(widget.focusedMovie.overview)
              ],
            ),
          )
        ],
      ),
    );
  }
}
