import 'dart:convert';
import 'package:http/http.dart' as http;

class _MoviesProvider {
  List<dynamic> movies = [];

  Future<List<dynamic>> cargarData() async {
    final url = Uri.https('api.themoviedb.org', '/3/movie/now_playing',
        {'api_key': 'apikey', 'language': 'en-US'});

    final response = await http.get(url);
    if (response.statusCode == 200) {
      Map dataMap = json.decode(response.body);
      movies = dataMap['results'];
    } else {
      print('Hubo un problema al traer datos');
    }

    return movies;
  }
}

final moviesProvider = new _MoviesProvider();
