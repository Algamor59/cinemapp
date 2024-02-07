import 'package:http/http.dart' as http;
import 'dart:convert';

import 'api_config.dart';
import 'models/movie.dart';

class MovieService {
  static Future<List<Movie>> fetchMovies() async {
    final response = await http.get(Uri.parse(
      '${ApiConfig.baseUrl}/movie/popular?api_key=${ApiConfig.apiKey}',
    ));
    if (response.statusCode == 200) {
      final data = json.decode(response.body);
      final List<dynamic> results = data['results'];
      return results.map((json) => Movie.fromJson(json)).toList();
    } else {
      throw Exception('Failed to fetch movies');
    }
  }

  static Future<List<Map<String, dynamic>>> fetchGenres() async {
    //for each
    final response = await http.get(Uri.parse('${ApiConfig.baseUrl}/genre/{Liste[i]}?api_key=${ApiConfig.apiKey}'));
    //return response;
    if (response.statusCode == 200) {
      final data = json.decode(response.body);
      final List<dynamic> genres = data['genres'];
      return genres.cast<Map<String, dynamic>>(); // Cast each genre to a Map<String, dynamic>
    } else {
      throw Exception('Failed to fetch genres');
    }
  }
}