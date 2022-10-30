import 'package:flutter_test/flutter_test.dart';
import 'package:rick_and_morty/models/character.dart';
import 'package:rick_and_morty/models/content_page.dart';
import 'package:rick_and_morty/fetchers/page_fetcher/character_fetcher.dart';

void main() async {
  group('Character fetcher', (){
    test('fetchPage(0) should return 20 characters', () async {
      final fetcher = CharacterFetcher();
      ContentPage? page = await fetcher.fetchPage(1);
      expect(page?.items.length, 20);
    });
  });
}