import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'api_config.dart';
import 'models/movie.dart';
import 'homePage.dart';

class filmPage extends StatelessWidget {
  final Movie movie;

  final List<Movie> movies;

  const filmPage({super.key, required this.movie, required this.movies});

  @override
  Widget build(BuildContext context) {
    String genres = "";
    for (var element in movie.genre) {
      genres += "${element.name}, ";
    }
    genres = genres.substring(0, genres.length - 2);
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.navigate_before),
          tooltip: 'Go back',
          onPressed: () {
            Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => MovieListView(
                    movies: movies,
                  ),
                ));
          },
        ),
        title: Center(child: Text(movie.title)),
        actions: <Widget>[
          IconButton(
            icon: const Icon(Icons.info_outline),
            tooltip: 'Information ULTRA IMPORTANTE',
            onPressed: () {
              ScaffoldMessenger.of(context)
                  .showSnackBar(const SnackBar(content: Text('Banger ce film non ?')));
            },
          ),
        ],
      ),
      body: Stack(
        children: [
          Container(
            padding: const EdgeInsets.fromLTRB(20.0, 0.0, 20.0, 20.0),
            decoration: BoxDecoration(
              color: Colors.grey[900],
            ),
            child: ListView(
              shrinkWrap: true,
              children: [
                CachedNetworkImage(
                  imageUrl:
                  '${ApiConfig.imageBaseUrl}${movie.posterPath}',
                  height: 350,
                  // C'est pour de la gestion d'erreur et le temps de chargement
                  placeholder: (context, url) =>
                  const CircularProgressIndicator(
                    color: Colors.deepPurple,
                  ),
                  errorWidget: (context, url, error) =>
                  const Icon(Icons.error),
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(0.0, 20.0, 0.0, 0.0),
                  child: Text(
                    "Overview",
                    style: TextStyle(color: Colors.white, fontSize: 20),
                  ),
                ),
                Text(
                  movie.overview,
                  style: TextStyle(color: Colors.white),
                ),
                Divider(
                  height: 30,
                  color: Colors.purple,
                ),
                Text("Genre",
                    style: TextStyle(color: Colors.white, fontSize: 20)),
                Text(
                  genres,
                  style: TextStyle(color: Colors.white),
                ),
                Divider(
                  height: 30,
                  color: Colors.purple,
                ),
                Text("Release date",
                    style: TextStyle(color: Colors.white, fontSize: 20)),
                Text(
                  movie.releaseDate,
                  style: TextStyle(color: Colors.white),
                ),
                Divider(
                  height: 30,
                  color: Colors.purple,
                ),
                Text("Average Note",
                    style: TextStyle(color: Colors.white, fontSize: 20)),
                Text(
                  movie.voteAverage.toString().substring(0,3)+"/10",
                  style: TextStyle(color: Colors.white),
                ),
              ],
            ),
          ),
        ],
      ),
      floatingActionButton: const FloatingActionButton(
          tooltip: 'Add to favorite',
          child: Icon(Icons.favorite_border),
          onPressed: null),
    );
  }
}
