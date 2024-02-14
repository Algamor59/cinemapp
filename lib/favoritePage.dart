import 'package:flutter/material.dart';
import 'package:http/http.dart' as http; // Importer le package HTTP
import 'dart:convert'; // Importer la bibliothèque dart:convert


void main() {
  runApp(const FavoritePage());
}

class Movie {
  final int id;
  final String title;
  final String imageUrl;

  Movie({required this.id, required this.title, required this.imageUrl});
}

class FavoritePage extends StatelessWidget {
  const FavoritePage({Key? key}) : super(key: key);

  Future<List<Movie>> fetchFavoriteMovies() async {
    // Récupérer la liste de films favoris depuis votre base de données Alwaysdata
    // Exemple d'URL hypothétique pour récupérer les favoris
    final response = await http.get(Uri.parse('https://example.com/favorites'));
    
    if (response.statusCode == 200) {
      // Analyser la réponse JSON et construire la liste de films
      List<Movie> movies = [];
      // Exemple d'analyse JSON hypothétique
      List<dynamic> data = json.decode(response.body);
      data.forEach((item) {
        movies.add(Movie(id: item['id'], title: item['title'], imageUrl: item['imageUrl']));
      });
      return movies;
    } else {
      // Gérer les erreurs de requête
      throw Exception('Failed to load favorite movies');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Favorite Movies'),
      ),
      body: FutureBuilder<List<Movie>>(
        future: fetchFavoriteMovies(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          } else if (snapshot.hasData) {
            return ListView.builder(
              itemCount: snapshot.data!.length,
              itemBuilder: (context, index) {
                final movie = snapshot.data![index];
                return ListTile(
                  leading: Image.network(movie.imageUrl),
                  title: Text(movie.title),
                  // Vous pouvez ajouter d'autres éléments ici comme la date de sortie, la note, etc.
                );
              },
            );
          } else {
            return Center(child: Text('No data'));
          }
        },
      ),
    );
  }
}
