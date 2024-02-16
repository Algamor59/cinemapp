import 'package:flutter/material.dart';
import 'package:tmdb_api/tmdb_api.dart';
import 'homePage.dart'; // Importez la page HomePage
import 'loginPage.dart'; // Importez la page HomePage
import 'main.dart';
import 'models/movie.dart';

class CreateAccountPage extends StatelessWidget {
  final List<Movie> movies;
  final _formKey = GlobalKey<FormState>();
  CreateAccountPage({super.key, required this.movies});

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
              padding: const EdgeInsets.fromLTRB(20.0, 20.0, 20.0, 285.0),
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
                  Form(
                    key: _formKey,
                    child: Column(
                      children: [
                        TextFormField(
                          style: const TextStyle(color: Colors.white),
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Please enter your nickname';
                            }
                            return null;
                          },
                          decoration: const InputDecoration(
                            border: UnderlineInputBorder(),
                            labelText: 'Enter your nickname',
                            labelStyle: TextStyle(color: Colors.white),
                          ),
                        ),
                        TextFormField(
                          style: const TextStyle(color: Colors.white),
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Please enter your email';
                            }
                            return null;
                          },
                          decoration: const InputDecoration(
                            border: UnderlineInputBorder(),
                            labelText: 'Enter your email',
                            labelStyle: TextStyle(color: Colors.white),
                          ),
                        ),
                        TextFormField(
                          style: const TextStyle(color: Colors.white),
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Please enter your password';
                            }
                            return null;
                          },
                          decoration: const InputDecoration(
                            border: UnderlineInputBorder(),
                            labelText: 'Enter your password',
                            labelStyle: TextStyle(color: Colors.white),
                          ),
                        ),
                        TextFormField(
                          style: const TextStyle(color: Colors.white),
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Please enter your password again';
                            }
                            return null;
                          },
                          decoration: const InputDecoration(
                            border: UnderlineInputBorder(),
                            labelText: 'Enter your password again',
                            labelStyle: TextStyle(color: Colors.white),
                          ),
                        ),
                      ],
                    ),
                  ),

                  Padding(
                    padding: const EdgeInsets.only(top: 20.0),
                    child: FloatingActionButton(
                      onPressed: () {
                        if (_formKey.currentState!.validate()) {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => MovieListView(
                                movies: this.movies,
                              )),
                        );
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(content: Text('Account created')),
                        );
                      }

                      },
                      child: const Text("Create Account"),
                    ),
                  ),
                  // Bouton "Already have an account ?" menant à la page LoginPage
                  Padding(
                    padding: const EdgeInsets.only(top: 10.0),
                    child: GestureDetector(
                      onTap: () {
                        // Action à effectuer lors de l'appui sur le bouton "Already have an account ?"
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => LoginPage(movies : movies)),
                        );
                      },
                      child: const Text(
                        "Already have an account ?",
                        style: TextStyle(color: Colors.white),
                      ),
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
