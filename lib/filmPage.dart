import 'package:flutter/material.dart';

void main() {
  runApp(const filmPage());
}

class filmPage extends StatelessWidget {
  const filmPage({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Cinemapp',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // TRY THIS: Try running your application with "flutter run". You'll see
        // the application has a purple toolbar. Then, without quitting the app,
        // try changing the seedColor in the colorScheme below to Colors.green
        // and then invoke "hot reload" (save your changes or press the "hot
        // reload" button in a Flutter-supported IDE, or press "r" if you used
        // the command line to start the app).
        //
        // Notice that the counter didn't reset back to zero; the application
        // state is not lost during the reload. To reset the state, use hot
        // restart instead.
        //
        // This works for code too, not just values: Most code changes can be
        // tested with just a hot reload.
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  get onPressed => null;

  get child => null;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
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
        title: const Center(child: Text("title")),
        actions: <Widget>[
          IconButton(
            icon: const Icon(Icons.info_outline),
            tooltip: 'Add Favorites',
            onPressed: () {
              ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(content: Text('GNGNGNGNGNGN')));
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
        onPressed: null
      ),
    );
  }
}
