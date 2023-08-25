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
    ref.read(pupularMoviesProvider.notifier).loadNextPage();
    ref.read(upcomingMoviesProvider.notifier).loadNextPage();
    ref.read(topRatedMoviesProvider.notifier).loadNextPage();
  }

  @override
  Widget build(BuildContext context) {
    final nowPlayingMovies = ref.watch(nowPlayingMoviesProvider);
    final nowPlayingMoviesSlide = ref.watch(moviesSlideShowProvider);
    final popularMovies = ref.watch(pupularMoviesProvider);
    final upcomingMovies = ref.watch(upcomingMoviesProvider);
    final topRatedMovies = ref.watch(topRatedMoviesProvider);

    return FullScreenLoader();

    return CustomScrollView(slivers: [
      const SliverAppBar(
        floating: true,
        flexibleSpace: FlexibleSpaceBar(
          title: CustomAppbar(),
        ),
      ),
      SliverList(
          delegate: SliverChildBuilderDelegate((context, index) {
        return Column(
          children: [
            MoviesSlideShow(movies: nowPlayingMoviesSlide),
            MovieHorizontalListView(
                movies: nowPlayingMovies,
                title: 'En cines',
                loadNextPage: () {
                  ref.read(nowPlayingMoviesProvider.notifier).loadNextPage();
                }),
            MovieHorizontalListView(
                movies: upcomingMovies,
                title: 'Próximamente',
                loadNextPage: () {
                  ref.read(nowPlayingMoviesProvider.notifier).loadNextPage();
                }),
            MovieHorizontalListView(
                movies: popularMovies,
                title: 'Populares',
                loadNextPage: () {
                  ref.read(pupularMoviesProvider.notifier).loadNextPage();
                }),
            MovieHorizontalListView(
                movies: topRatedMovies,
                title: 'Mejores calificadas',
                loadNextPage: () {
                  ref.read(nowPlayingMoviesProvider.notifier).loadNextPage();
                }),
            const SizedBox(
              height: 50,
            )
          ],
        );
      }, childCount: 1)),
    ]);
  }
}
