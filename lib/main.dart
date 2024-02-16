import 'package:flutter/material.dart';
import 'loginPage.dart'; // Importer la page de connexion
import 'favoritePage.dart';
import 'movie_service.dart';
import 'models/movie.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Cinemapp',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Cinemapp'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  List<Movie> movies = [];
  bool isDataLoaded = false;

  @override
  void initState() {
    super.initState();
    //Charger tout les films provenant de l'API
    fetchMovies();
  }

  Future<void> fetchMovies() async {
    try {
      final List<Movie> fetchedMovies = await MovieService.fetchMovies();

      if (fetchedMovies != null) {
        setState(() {
          movies = fetchedMovies;
          isDataLoaded = true;
        });
      } else {
        print('Error fetching movies, we dont know why yet');
        // Gérer le cas où les données sont nulles
      }
    } catch (e) {
      print('Error fetching movies: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: isDataLoaded
            ? LoginPage(
                movies:
                    movies) // Afficher LoginPage uniquement lorsque les données sont prêtes
            : const Center(child: CircularProgressIndicator()));
  }
}
