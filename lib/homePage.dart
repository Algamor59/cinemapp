import 'package:cinemapp_app/api_config.dart';
import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'models/movie.dart';

class MovieListView extends StatelessWidget {
  final List<Movie> movies;

  const MovieListView({super.key, required this.movies});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: NavigationBar(
        backgroundColor: Colors.black87,
        destinations: const <Widget>[
          NavigationDestination(
            icon: Icon(
              Icons.home,
              color: Colors.deepPurple,
            ),
            label: '',
          ),
          NavigationDestination(
            icon: Icon(
              Icons.person,
              color: Colors.deepPurple,
            ),
            label: '',
          ),
        ],
      ),
      body: Stack(
        children: [
          // Background image
          const Positioned(
            top: 0,
            left: 0,
            right: 0,
            child: Image(
              image: AssetImage('assets/images/background.png'),
              height: 200,
              fit: BoxFit.cover,
            ),
          ),
          Positioned(
            top: 167,
            left: 0,
            right: 0,
            child: Container(
              padding: const EdgeInsets.fromLTRB(10.0, 30.0, 10.0, 30),
              decoration: BoxDecoration(
                color: Colors.grey[900],
                borderRadius: BorderRadius.circular(30.0),
              ),
              child: ListView.builder(
                itemCount: 8,
                itemBuilder: (context, index) {
                  final movie = movies[index];
                  String genres = "";
                  movie.genre.forEach((element) {
                    genres += element.name + ", ";
                  });
                  genres = genres.substring(0, genres.length - 2);
                  return ListTile(
                    leading: CachedNetworkImage(
                      imageUrl: '${ApiConfig.imageBaseUrl}${movie.posterPath}',
                      width: 60,
                      height: 90,
                      fit: BoxFit.cover,
                      placeholder: (context, url) =>
                          const CircularProgressIndicator(
                        color: Colors.deepPurple,
                      ),
                      errorWidget: (context, url, error) =>
                          const Icon(Icons.error),
                    ),
                    title: Text(
                      movie.title,
                      style: TextStyle(color: Colors.white),
                    ),
                    subtitle:
                        Text(genres, style: TextStyle(color: Colors.white)),
                    trailing: Text('Rating: ${movie.voteAverage}',
                        style: TextStyle(color: Colors.white)),
                  );
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}
