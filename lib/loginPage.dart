import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

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
          // Content
          Positioned(
            top: 167,
            left: 0,
            right: 0,
            child: Container(
              padding: const EdgeInsets.fromLTRB(20.0,20.0,20.0,285.0),
              decoration: BoxDecoration(
                color: Colors.grey[900],
                borderRadius: BorderRadius.circular(30.0),
              ),
              child: ListView(
                shrinkWrap: true,
                children: <Widget>[
                  // Logo
                  const Padding(
                    padding: EdgeInsets.only(bottom: 15.0),
                    child: Image(
                      image: AssetImage('assets/images/cinemapplogo.png'),
                      height: 50,
                    ),
                  ),
                  // TextFields
                  TextFormField(
                    style: const TextStyle(color: Colors.white),
                    decoration: const InputDecoration(
                      border: UnderlineInputBorder(),
                      labelText: 'Enter your email',
                      labelStyle: TextStyle(color: Colors.white),
                    ),
                  ),
                  TextFormField(
                    style: const TextStyle(color: Colors.white),
                    decoration: const InputDecoration(
                      border: UnderlineInputBorder(),
                      labelText: 'Enter your password',
                      labelStyle: TextStyle(color: Colors.white),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 20.0),
                    child: FloatingActionButton(
                      onPressed: onPressed,
                      child: const Text("Sign in with email"),
                    ),
                  ),
                  const Padding(
                    padding: EdgeInsets.only(top: 10.0),
                    child: Text(
                      "Create account",
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
