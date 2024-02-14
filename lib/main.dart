import 'package:flutter/material.dart';
import 'homePage.dart';
import 'movie_service.dart';
import 'models/movie.dart';
void main() {
  runApp(const MovieExplorerApp());
}



class MovieExplorerApp extends StatelessWidget {
  const MovieExplorerApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Movie Explorer',
      theme: ThemeData(primarySwatch: Colors.blue),
      home: const MovieExplorerHomePage(),
    );
  }
}



class MovieExplorerHomePage extends StatefulWidget {
  const MovieExplorerHomePage({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _MovieExplorerHomePageState createState() => _MovieExplorerHomePageState();
}

class _MovieExplorerHomePageState extends State<MovieExplorerHomePage> {
  List<Movie> movies = [];

  @override
  void initState() {
    super.initState();
    fetchMovies();
  }

  Future<void> fetchMovies() async {
    try {
    final List<Movie>? fetchedMovies = await MovieService.fetchMovies();
    

    if (fetchedMovies != null) {
      setState(() {
        movies = fetchedMovies;
      });
    } else {
      // Gérer le cas où les données sont nulles
      // Peut-être afficher un message d'erreur à l'utilisateur
    }
  } catch (e) {
    // ignore: avoid_print
    print('Error fetching movies: $e');
  }
}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: MovieListView(movies: movies),
    );
  }
}
