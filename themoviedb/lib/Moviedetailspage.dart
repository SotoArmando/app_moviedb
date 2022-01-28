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
                      image: NetworkImage(Movidedbdescendant.imageurl(
                          widget.focusedMovie.backdrop_path))),
                  color: Colors.transparent,
                  shape: BoxShape.rectangle),
              width: double.infinity,
            ),
          ),
          Container(
            alignment: Alignment.center,
            child: Text(widget.focusedMovie.title),
          )
        ],
      ),
    );
  }
}
