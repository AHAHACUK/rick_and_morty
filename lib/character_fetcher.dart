import 'dart:convert';

import 'package:rick_and_morty/models/character.dart';
import 'package:http/http.dart' as http;

class CharacterFetcher {

  static const String _baseUrl = "https://rickandmortyapi.com/api";

  Future<Character> fetch(int id) async {
    Uri uri = Uri.parse(_baseUrl);
    uri = uri.replace(
      pathSegments: ['api', 'character', id.toString()]
    );
    var response = await http.get(uri);
    Map<String, dynamic> jsonResponse = jsonDecode(response.body);
    return Character.fromJson(jsonResponse);
  }

  Future<List<Character>> fetchPage(int page) async {
    Uri uri = Uri.parse(_baseUrl);
    uri = uri.replace(
      pathSegments: ['api', 'character'],
      queryParameters: {
        'page': page.toString()
      }
    );
    var response = await http.get(uri);
    Map<String, dynamic> jsonResponse = jsonDecode(response.body);
    return [for(dynamic characterJson in jsonResponse['results']) Character.fromJson(characterJson)];
  }
}