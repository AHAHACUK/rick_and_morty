import 'package:flutter_test/flutter_test.dart';
import 'package:rick_and_morty/character_fetcher.dart';
import 'package:rick_and_morty/models/character.dart';

void main() async {
  group('Character fetcher', (){
    test('fetch(1) should return Rick', () async {
      final fetcher = CharacterFetcher();
      Character character = await fetcher.fetch(1);
      expect(character.name, 'Rick Sanchez');
    });

    test('fetchPage(0) should return 20 characters', () async {
      final fetcher = CharacterFetcher();
      List<Character> characters = await fetcher.fetchPage(1);
      expect(characters.length, 20);
    });
  });
}