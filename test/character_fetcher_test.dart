import 'package:flutter_test/flutter_test.dart';
import 'package:rick_and_morty/models/character.dart';
import 'package:rick_and_morty/models/page.dart';
import 'package:rick_and_morty/fetchers/page_fetcher/character_fetcher.dart';

void main() async {
  group('Character fetcher', (){
    test('fetch(1) should return Rick', () async {
      final fetcher = CharacterFetcher();
      Character? character = await fetcher.fetchItemById(1);
      expect(character?.name, 'Rick Sanchez');
    });

    test('fetchPage(0) should return 20 characters', () async {
      final fetcher = CharacterFetcher();
      Page? page = await fetcher.fetchPage(1);
      expect(page?.items.length, 20);
    });
  });
}