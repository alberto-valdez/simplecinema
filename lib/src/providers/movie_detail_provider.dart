import 'package:http/http.dart' as http;
import 'dart:convert';

class _MovieDetailProvider {
  dynamic movie;

  Future<dynamic> cargarData(String id) async {
    final url = Uri.https('api.themoviedb.org', '/3/movie/$id',
        {'api_key': 'apikey', 'language': 'en-US'});

    final response = await http.get(url);

    if (response.statusCode == 200) {
      print('Hay datos');
      movie = json.decode(response.body);
    } else {
      print('Hubo un error');
    }

    return movie;
  }
}

final movieDetailProvider = new _MovieDetailProvider();
