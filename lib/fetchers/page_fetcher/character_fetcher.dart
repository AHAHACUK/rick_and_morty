import 'dart:convert';
import 'dart:io';

import 'package:rick_and_morty/models/character.dart';
import 'package:http/http.dart' as http;
import 'package:rick_and_morty/models/content_page.dart';
import 'package:rick_and_morty/fetchers/page_fetcher/page_fetcher.dart';

class CharacterFetcher implements PageFetcher<Character>{

  static const String _baseUrl = "https://rickandmortyapi.com/api";

  @override
  Future<ContentPage<Character>?> fetchPage(int pageNumber) async {
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
    ContentPage<Character> page = ContentPage(
      jsonResponse['info']['pages'],
      pageNumber,
      Character.listFromJson(jsonResponse['results']),
      jsonResponse['info']['next'] != null,
      jsonResponse['info']['prev'] != null
    );
    return page;
  }
}