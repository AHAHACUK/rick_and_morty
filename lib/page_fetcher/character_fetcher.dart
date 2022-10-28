import 'dart:convert';
import 'dart:io';

import 'package:rick_and_morty/models/character.dart';
import 'package:http/http.dart' as http;
import 'package:rick_and_morty/models/page.dart';
import 'package:rick_and_morty/page_fetcher/page_fetcher.dart';

class CharacterFetcher implements PageFetcher<Character>{

  static const String _baseUrl = "https://rickandmortyapi.com/api";

  @override
  Future<Character?> fetchItemById(int id) async {
    Uri uri = Uri.parse(_baseUrl);
    uri = uri.replace(
      pathSegments: ['api', 'character', id.toString()]
    );
    var response = await http.get(uri);
    if (response.statusCode != HttpStatus.ok) {
      return null;
    }
    Map<String, dynamic> jsonResponse = jsonDecode(response.body);
    return Character.fromJson(jsonResponse);
  }

  @override
  Future<Page<Character>?> fetchPage(int pageNumber) async {
    Uri uri = Uri.parse(_baseUrl);
    uri = uri.replace(
      pathSegments: ['api', 'character'],
      queryParameters: {
        'page': pageNumber.toString()
      }
    );
    var response = await http.get(uri);
    if (response.statusCode != HttpStatus.ok) {
      return null;
    }
    Map<String, dynamic> jsonResponse = jsonDecode(response.body);
    Page<Character> page = Page(
      pageNumber,
      Character.listFromJson(jsonResponse['results']),
      jsonResponse['next'] != null,
      jsonResponse['prev'] != null
    );
    return page;
  }
}