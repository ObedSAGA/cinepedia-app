import 'package:flutter/material.dart';
import 'package:cinemapedia/config/constants/environment.dart';

class HomeScreenMovies extends StatelessWidget {
  static const name = 'homeScreen-movies';


  const HomeScreenMovies({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text(Environment.movieDBApiKey),
      ),
    );
  }
}