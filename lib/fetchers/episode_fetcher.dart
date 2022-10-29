import 'dart:convert';
import 'dart:io';

import 'package:rick_and_morty/models/episode.dart';
import 'package:http/http.dart' as http;

class EpisodeFetcher {
  static const String _baseUrl = "https://rickandmortyapi.com";

  Future<List<Episode>?> fetchListByIds(List<int> ids) async {
    Uri uri = Uri.parse(_baseUrl);
    uri = uri.replace(
      pathSegments: ['api', 'episode', "${ids.join(',')},"]
    );
    var response = await http.get(uri);
    if (response.statusCode != HttpStatus.ok) {
      return null;
    }
    List<dynamic> jsonResponse = jsonDecode(response.body);
    return Episode.listFromJson(jsonResponse);
  }
}