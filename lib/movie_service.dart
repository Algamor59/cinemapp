import 'package:cinemapp_app/models/genre.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

import 'api_config.dart';
import 'models/movie.dart';

class MovieService {
  static Future<List<Movie>> fetchMovies() async {
    List<Movie> movies = [];
    final response = await http.get(Uri.parse(
      '${ApiConfig.baseUrl}/movie/popular?api_key=${ApiConfig.apiKey}',
    ));
    if (response.statusCode == 200) {
      final data = json.decode(response.body);
      final List<dynamic> results = data['results'];

      for (int i = 0; i < results.length; i++) {
        List<int> genres = results[i]['genre_ids'].cast<int>();
        results[i]['genre'] = [];
        for (int j = 0; j < genres.length; j++) {
          var responseGenre = await http.get(Uri.parse(
              '${ApiConfig.baseUrl}/genre/${genres[j]}?api_key=${ApiConfig.apiKey}'));
          if (responseGenre.statusCode == 200) {
            final dataGenre = json.decode(responseGenre.body);
            results[i]['genre'].add(Genre.fromJson(dataGenre));
            movies = results.map((json) => Movie.fromJson(json)).toList();
            //movies[i].genre.add(Genre.fromJson(dataGenre));
          } else {
            throw Exception('Failed to fetch genres');
          }
        }
      }

      return movies;
    } else {
      throw Exception('Failed to fetch movies');
    }
  }
}
