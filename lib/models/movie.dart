import 'genre.dart';

class Movie {
  final int id;
  final String title;
  final String overview;
  final String posterPath;
  final String releaseDate;
  final double voteAverage;
  final List<int> genreIds; // Ajout de la liste des identifiants de genre
  final List<Genre> genre;


  Movie({
    required this.id,
    required this.title,
    required this.overview,
    required this.posterPath,
    required this.releaseDate,
    required this.voteAverage,
    required this.genreIds,
    List<Genre>? genre
  }) : genre = genre ?? [];

  factory Movie.fromJson(Map<String, dynamic> json) {
    return Movie(
      id: json['id'],
      title: json['title'],
      overview: json['overview'],
      posterPath: json['poster_path'],
      releaseDate: json['release_date'],
      voteAverage: json['vote_average'].toDouble(),
      genreIds: List<int>.from(json['genre_ids']),
      genre: json['genre'] != null
          ? List<Genre>.from((json['genre'] as List<dynamic>?) ?? [])
          : null,
    );
  }
}