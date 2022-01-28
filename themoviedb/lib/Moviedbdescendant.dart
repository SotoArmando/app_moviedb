import 'dart:async';
import 'dart:convert';
import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:themoviedb/descendants/recipe.dart';

const baseurl = 'image.tmdb.org';
const baseurl1 = 'image.tmdb.org';

class Movidedbdescendant {
  static const _toprated =
          '/3/movie/top_rated?api_key=bf091621962bdf5c30339e874a2a0c1a&language=en-US&page=1',
      _imageurl = '/t/p/w500/',
      _listrecipes = '/tastydescendant/listrecipes',
      _listtags = '/tastydescendant/listtags',
      _listfeeds = '/tastydescendant/listfeeds',
      _listsimilarities = '/tastydescendant/listsimilarities';

  static Future<List<dynamic>> imageurl(
      {String path = "q6y0Go1tsGEsmtFryDOJo3dEmqu.jpg"}) async {
    final response = await http.get(Uri.https(baseurl, _imageurl + path));

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

  static Future<List<dynamic>> toprated() async {
    final response = await http.get(Uri.https(baseurl, _toprated));

    if (response.statusCode == 200) {
      // If the call to the server was successful, parse the JSON
      List<dynamic> values = [];
      values = json.decode(response.body);
      return values;
    } else {
      // If that call was not successful, throw an error.
      throw Exception('Failed to load post');
    }
  }
}
