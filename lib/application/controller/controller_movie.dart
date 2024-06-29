// ignore_for_file: avoid_print

import 'dart:convert';
import 'package:netflix_app/application/model/movie_model.dart';
import 'package:http/http.dart' as http;

int retries = 3;
int count = 0;

class MovieServices {
  static const String _popular =
      'https://api.themoviedb.org/3/movie/popular?api_key=86c2425bc0aeb063f561a5c756d9de87';
  static const String _nowplaying =
      'https://api.themoviedb.org/3/movie/now_playing?api_key=86c2425bc0aeb063f561a5c756d9de87';
  static const String _toprated =
      'https://api.themoviedb.org/3/movie/top_rated?api_key=86c2425bc0aeb063f561a5c756d9de87';
  static const String _upcoming =
      'https://api.themoviedb.org/3/movie/upcoming?api_key=86c2425bc0aeb063f561a5c756d9de87';

  static Future<List<Movie>> getMovies(String url) async {
    int currentRetries = 0;
    while (currentRetries < retries) {
      try {
        final response = await http.get(Uri.parse(url));
        if (response.statusCode == 200) {
          print(response.statusCode);
          List<dynamic> data = jsonDecode(response.body)['results'];
          return data.map((json) => Movie.fromJson(json)).toList();
        } else {
          print('Failed to load data: ${response.statusCode}');
        }
      } catch (e) {
        print('Error caught is $e');
      }
      currentRetries++;
    }
    return [];
  }

  static Future<List<Movie>> getNowPopular() async {
    return getMovies(_popular);
  }

  static Future<List<Movie>> getNowPlaying() async {
    return getMovies(_nowplaying);
  }

  static Future<List<Movie>> getTopRated() async {
    return getMovies(_toprated);
  }

  static Future<List<Movie>> getUpcoming() async {
    return getMovies(_upcoming);
  }
}
