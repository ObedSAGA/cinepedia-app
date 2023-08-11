import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:cinemapedia/presentation/providers/providers.dart';
import 'package:cinemapedia/presentation/widgets/widgets.dart';

class HomeScreenMovies extends StatelessWidget {
  static const name = 'homeScreen-movies';

  const HomeScreenMovies({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
        body: Scaffold(
      body: _HomeView(),
      bottomNavigationBar: CustomBottomNavigation(),
    ));
  }
}

class _HomeView extends ConsumerStatefulWidget {
  const _HomeView();

  @override
  _HomeVIewState createState() => _HomeVIewState();
}

class _HomeVIewState extends ConsumerState<_HomeView> {
  @override
  void initState() {
    super.initState();

    ref.read(nowPlayingMoviesProvider.notifier).loadNextPage();
  }

  @override
  Widget build(BuildContext context) {
    final nowPlayingMovies = ref.watch(nowPlayingMoviesProvider);
    final nowPlayingMoviesSlide = ref.watch(moviesSlideShowProvider);

    if (nowPlayingMoviesSlide.isEmpty) return const CircularProgressIndicator();

    return Column(
      children: [
        const CustomAppbar(),
        MoviesSlideShow(movies: nowPlayingMoviesSlide),
        MovieHorizontalListView(
            movies: nowPlayingMovies,
            title: 'En cines',
            subtitle: 'Lunes 20',
            loadNextPage: () {
              ref.read(nowPlayingMoviesProvider.notifier).loadNextPage();
            })
      ],
    );
  }
}
