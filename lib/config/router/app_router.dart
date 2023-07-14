import 'package:cinemapedia/presentation/screens/screens.dart';
import 'package:go_router/go_router.dart';

final appRouter = GoRouter(
  routes: [
    GoRoute(
      path: '/',
      name: HomeScreenMovies.name,
      builder: (context, state) => const HomeScreenMovies(),
    ),
  ]
  );
