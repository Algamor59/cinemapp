import 'package:flutter/material.dart';

class FavoritePage extends StatelessWidget {
  const FavoritePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //Nav Bar du haut
      appBar: AppBar(
        //Retour en arrière
        leading: IconButton(
          icon: const Icon(Icons.navigate_before),
          tooltip: 'Go back',
          onPressed: () {
            Navigator.push(context, MaterialPageRoute<void>(
              builder: (BuildContext context) {
                return Scaffold(
                  appBar: AppBar(
                    title: const Text('Next page'),
                  ),
                  body: const Center(
                    child: Text(
                      'This is the next page',
                      style: TextStyle(fontSize: 24),
                    ),
                  ),
                );
              },
            ));
          },
        ),
        title: const Center(child: Text("favorites")),
        actions: <Widget>[
          IconButton(
            icon: const Icon(Icons.info_outline),
            tooltip: 'Add Favorites',
            onPressed: () {
              ScaffoldMessenger.of(context)
                  .showSnackBar(const SnackBar(content: Text('GNGNGNGNGNGN')));
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
              children: const [
                Image(
                  image: AssetImage('assets/images/poster_template.jpg'),
                  height: 350,
                  //fit: BoxFit.contain,
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(0.0, 20.0, 0.0, 0.0),
                  child: Text(
                    "Overview",
                    style: TextStyle(color: Colors.white, fontSize: 20),
                  ),
                ),
                Text(
                  "LOREM IPSUM LOREM IPSUM LOREM IPSUM LOREM IPSUM LOREM IPSUM LOREM IPSUM",
                  style: TextStyle(color: Colors.white),
                ),
                Divider(
                  height: 30,
                  color: Colors.purple,
                ),
                Text("Genre",
                    style: TextStyle(color: Colors.white, fontSize: 20)),
                Text(
                  "Thriller",
                  style: TextStyle(color: Colors.white),
                ),
                Divider(
                  height: 30,
                  color: Colors.purple,
                ),
                Text("Producer",
                    style: TextStyle(color: Colors.white, fontSize: 20)),
                Text(
                  "Jordan Peele",
                  style: TextStyle(color: Colors.white),
                ),
                Divider(
                  height: 30,
                  color: Colors.purple,
                ),
                Text("Release date",
                    style: TextStyle(color: Colors.white, fontSize: 20)),
                Text(
                  "2023-12-01",
                  style: TextStyle(color: Colors.white),
                ),
                Divider(
                  height: 30,
                  color: Colors.purple,
                ),
                Text("Average Note",
                    style: TextStyle(color: Colors.white, fontSize: 20)),
                Text(
                  "9/10",
                  style: TextStyle(color: Colors.white),
                ),
              ],
            ),
          ),
        ],
      ),
      floatingActionButton: const FloatingActionButton(
          tooltip: 'Add to favorite',
          child: Icon(Icons.favorite),
          onPressed: null),
    );
  }
}
