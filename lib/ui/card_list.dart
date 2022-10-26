import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:rick_and_morty/models/character.dart';

class CharacterCardList extends StatelessWidget {
  final List<Character> characters;
  const CharacterCardList(this.characters, { Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context){
    return Container(
      child: ListView.builder(
        itemCount: characters.length,
        itemBuilder: (context, index) {
          Character character = characters[index];
          return ListTile(
            title: Text(character.name),
          );
        }
      )
    );
  }
}