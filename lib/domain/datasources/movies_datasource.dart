import 'package:cinemapedia/domain/entities/movie.dart';

abstract class MovieDataSource {
  Future<List<Movie>> get({int page = 1});
}
