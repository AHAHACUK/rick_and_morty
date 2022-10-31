import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:rick_and_morty/models/character.dart';
import 'package:rick_and_morty/ui/card_page.dart';
import 'package:rick_and_morty/ui/circle_clipper.dart';

class CharacterCardList extends StatelessWidget {
  final List<Character> characters;
  const CharacterCardList(this.characters, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: characters.length,
        itemBuilder: (context, index) {
          Character character = characters[index];
          return ListTile(
            leading: Hero(
              tag: "character_avatar ${character.name}",
              child: SizedBox(
                width: 60,
                child: ClipOval(
                    clipper: CircleClipper(),
                    child: Image.network(character.imgUrl)),
              ),
            ),
            title: Text(character.name),
            onTap: () => Navigator.of(context).push(MaterialPageRoute(
                builder: (context) => CharacterCardPage(character))),
          );
        });
  }
}
