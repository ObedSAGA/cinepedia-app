import 'package:flutter_dotenv/flutter_dotenv.dart';

class Environment {
  static String movieDBApiKey =
      dotenv.env['MOVIEDB_KEY'] ?? 'NO API KEY IS PROVIDED';
}
