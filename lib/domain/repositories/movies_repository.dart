import 'package:cinemapedia/domain/entities/movie.dart';

abstract class MovieRepository {



  Future<List<Movie>> get({int page = 1});

  
}