import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:themoviedb/Moviedbdescendant.dart';
import 'package:themoviedb/Moviedetailspage.dart';
import 'package:themoviedb/convenientTransition.dart';
import 'package:themoviedb/descendants/Movie.dart';

class Homepage extends StatefulWidget {
  Homepage({Key? key}) : super(key: key);

  @override
  _HomepageState createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  late Future<List<Movie>> futureMoviedblist;
  late Movie? focusedMovie;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    futureMoviedblist = Movidedbdescendant.toprated();
  }

  @override
  Widget build(BuildContext context) {
    print('build');
    return SingleChildScrollView(
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 10, vertical: 12.5),
        child: Column(
          children: [
            FutureBuilder<List<Movie>>(
              future: futureMoviedblist,
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  return Column(
                    children: [
                      for (Movie _movie in snapshot.data!)
                        Container(
                            margin: EdgeInsets.only(bottom: 5),
                            child: TextButton(
                              style: TextButton.styleFrom(
                                splashFactory: NoSplash.splashFactory,
                              ),
                              onPressed: () {
                                Navigator.of(context).push(SlideRightRoute(
                                    page: Moviedetailspage(
                                        focusedMovie: _movie)));
                              },
                              child: Material(
                                elevation: 4,
                                child: Container(
                                  alignment: Alignment.center,
                                  // decoration: BoxDecoration(
                                  //     border: Border.all(width: 1, color: Colors.black)),
                                  padding: EdgeInsets.only(
                                      top: 10,
                                      bottom: 2.5,
                                      left: 2.5,
                                      right: 12.5),
                                  height: 100,
                                  child: Row(
                                    children: [
                                      Container(
                                        height: 100,
                                        width: 100,
                                        decoration: BoxDecoration(
                                            shape: BoxShape.circle,
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
                                                image: NetworkImage(
                                                    Movidedbdescendant.imageurl(
                                                        _movie.poster_path))),
                                            color: Colors.transparent,
                                            shape: BoxShape.circle),
                                      ),
                                      Expanded(
                                        flex: 2,
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.stretch,
                                          children: [
                                            Text(
                                              _movie.title,
                                              textAlign: TextAlign.center,
                                            ),
                                            Text(
                                              '${_movie.vote_average.toString()} / 10',
                                              textAlign: TextAlign.end,
                                            ),
                                          ],
                                        ),
                                      )
                                    ],
                                  ),
                                ),
                              ),
                            ))
                    ],
                  );
                } else if (snapshot.hasError) {
                  return Text('${snapshot.error}');
                }

                // By default, show a loading spinner.
                return const CircularProgressIndicator();
              },
            ),
          ],
        ),
      ),
    );
  }
}
