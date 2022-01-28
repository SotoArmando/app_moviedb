import 'dart:async';
import 'dart:convert';
import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:themoviedb/descendants/Movie.dart';

const baseurl = 'image.tmdb.org';
const baseurl1 = 'api.themoviedb.org';
const authenticationparameters = {
  'api_key': 'bf091621962bdf5c30339e874a2a0c1a',
  'language': 'en-US',
  'page': 1
};

class Movidedbdescendant {
  static const _toprated = '/3/movie/top_rated', _imageurl = '/t/p/w500';

  static String imageurl(String path) {
    return 'https://${baseurl}${_imageurl}${path}';
  }

  static Future<List<Movie>> toprated() async {
    print('uri');
    print([baseurl1, _toprated, authenticationparameters]);
    final uri = Uri.parse(
        'https://api.themoviedb.org/3/movie/top_rated?api_key=bf091621962bdf5c30339e874a2a0c1a&language=en-US&page=1');
    print(uri);
    final response = await http.get(uri);
    if (response.statusCode == 200) {
      // If the call to the server was successful, parse the JSON
      List<Movie> values = [];
      (json.decode(response.body)['results'] as List<dynamic>)
          .forEach((e) => values.add(Movie.fromJson(e)));

      return values;
    } else {
      // If that call was not successful, throw an error.
      throw Exception('Failed to load post');
    }
  }
}
