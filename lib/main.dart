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
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
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
  @override
  void initState() {
    super.initState();
    fetchMovies();
    // Rediriger automatiquement vers la page de connexion
    Future.delayed(Duration.zero, () {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => LoginPage(movies: movies)),
      );
    });
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
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: Center(
        child: Text('Redirecting to Login Page...'),
      ),
    );
  }
}
