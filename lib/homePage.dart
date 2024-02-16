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
              Icons.favorite_border,
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
            top: 50,
            left: 50,
            right: 50,
            child: Container(
              width: 10,
              height: 70,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(30.0),
              ),
              child: const Image(
                image: AssetImage('assets/images/cinemapplogo.png'),
              ),
            ),
          ),
          Positioned(
            top: 167,
            left: 0,
            right: 0,
            child: Container(
              padding: const EdgeInsets.fromLTRB(10.0, 30.0, 10.0, 30),
              height: 800,
              width: 200,
              decoration: BoxDecoration(
                color: Colors.grey[900],
                borderRadius: BorderRadius.circular(30.0),
              ),
              child: GridView.builder(
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: 8.0,
                  mainAxisSpacing: 8.0,
                ),
                itemCount: 4,
                itemBuilder: (BuildContext context, int index) {
                  final movie = movies[index];
                  String genres = "";
                  movie.genre.forEach((element) {
                    genres += element.name + ", ";
                  });
                  genres = genres.substring(0, genres.length - 2);
                  return Card(
                    clipBehavior: Clip.antiAliasWithSaveLayer,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30),
                    ),
                    child: Stack(
                      fit: StackFit.expand,
                      children: [
                        CachedNetworkImage(
                          imageUrl:
                              '${ApiConfig.imageBaseUrl}${movie.posterPath}',
                          fit: BoxFit.cover,
                          // C'est pour de la gestion d'erreur et le temps de chargement
                          placeholder: (context, url) =>
                              const CircularProgressIndicator(
                            color: Colors.deepPurple,
                          ),
                          errorWidget: (context, url, error) =>
                              const Icon(Icons.error),
                        ),
                        Container(
                          decoration: BoxDecoration(
                            gradient: LinearGradient(
                              begin: Alignment.topCenter,
                              end: Alignment.bottomCenter,
                              colors: [
                                Colors.transparent,
                                Colors.black.withOpacity(0.7)
                              ],
                            ),
                          ),
                        ),
                        Positioned(
                          bottom: 10.0,
                          left: 18.0,
                          right: 8.0,
                          child: Text(
                            movie.title,
                            style: TextStyle(
                                fontSize: 16.0,
                                color: Colors.white,
                                fontWeight: FontWeight.w600),
                          ),
                        ),
                      ],
                    ),
                  );
                },
              ),
            ),
          ),
          Positioned(
            top: 140,
            left: 15,
            right: 15,
            child: TextField(
              decoration: InputDecoration(
                labelText: 'Search genres, movies, actors...',
                filled: true,
                fillColor: Colors.white,
                prefixIcon: const Icon(Icons.search),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10.0),
                  borderSide: const BorderSide(color: Colors.deepPurple),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
