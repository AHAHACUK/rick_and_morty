import 'package:flutter/material.dart';
import 'package:rick_and_morty/models/character.dart';
import 'package:rick_and_morty/ui/circle_clipper.dart';

class CharacterCardPage extends StatelessWidget {
  final Character character;
  const CharacterCardPage(this.character, { Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(),
      body: Column(children: [
        Expanded(flex: 1, child: ClipOval(clipper: CircleClipper(), child: Image.network(character.imgUrl))),
        Expanded(flex: 3, child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 4),
          child: Center(child: Column(children: [
            Expanded(flex: 1, child: Text(character.name))
          ]))
          )
        )
      ])
    );
  }
}