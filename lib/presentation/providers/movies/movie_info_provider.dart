import 'package:cinemapedia/presentation/providers/providers.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../domain/entities/movie.dart';

final movieInfoProvider = StateNotifierProvider((ref) {
  final movieRepository = ref.watch(movieRepositoryProvider);

  return MovieMapNotifer(getMovie: movieRepository.getMovieById);
});

/*
 Stete is like:
 {
  'id': Movie(),
  '8378473': Movie(),
  '8374744': Movie(),
 }
 */

typedef GetMovieCallback = Future<Movie> Function(String movieId);

class MovieMapNotifer extends StateNotifier<Map<String, Movie>> {
  final GetMovieCallback getMovie;

  MovieMapNotifer({required this.getMovie}) : super({});

  Future<void> loadMovie(String movieId) async {
    if (state[movieId] != null) return;

    final movie = await getMovie(movieId);

    state = {...state, movieId: movie};
  }
}
