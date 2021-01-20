import 'dart:convert';

import 'package:peliculas/src/models/pelicula_model.dart';

import 'package:http/http.dart' as http;

class PeliculasProvider {
  String _apikey = '1478bde49b2797c52dc4ebc3d877b2d9';
  String _url = 'api.themoviedb.org';
  String _language = 'es-ES';

  Future<List<Pelicula>> getEnCines() async {
    final url = Uri.https(_url, '3/movie/now_playing',
        {'api_key': _apikey, 'language': _language});

    final resp = await http.get(url);

    final decodedata = json.decode(resp.body);

    final peliculas = new Peliculas.fromJsonList(decodedata['results']);

    return peliculas.items;
  }
}
