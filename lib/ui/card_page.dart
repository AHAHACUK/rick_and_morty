import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rick_and_morty/bloc/content_loader_bloc.dart';
import 'package:rick_and_morty/bloc/function_loader_bloc.dart';
import 'package:rick_and_morty/models/character.dart';
import 'package:rick_and_morty/models/episode.dart';
import 'package:rick_and_morty/fetchers/episode_fetcher.dart';
import 'package:rick_and_morty/ui/circle_clipper.dart';

class CharacterCardPage extends StatelessWidget {
  final Character character;
  static const TextStyle nameStyle = TextStyle(fontSize: 32);
  static const TextStyle episodesHeaderStyle = TextStyle(fontSize: 20, color: Color.fromARGB(255, 87, 87, 87));
  const CharacterCardPage(this.character, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    EpisodeFetcher episodeFetcher = EpisodeFetcher();
    FunctionLoaderBloc<List<Episode>> contentLoader = FunctionLoaderBloc(
        () => episodeFetcher.fetchListByIds(character.episodesIds));
    contentLoader.add(ContentLoadInit());
    return Scaffold(
        appBar: AppBar(),
        body: BlocBuilder<ContentLoaderBloc, ContentLoaderState>(
          bloc: contentLoader,
          builder: (context, state) {
            if (state is NoContent) {
              return Container();
            }
            if (state is LoadingError) {
              return const Text('Woops :(');
            }
            if (state is ContentLoaded) {
              List<Episode> episodes = state.content;
              return Column(children: [
                const SizedBox(height: 10),
                Expanded(
                    flex: 1,
                    child: ClipOval(
                        clipper: CircleClipper(),
                        child: Image.network(character.imgUrl))),
                Expanded(
                    flex: 3,
                    child: Container(
                        padding: const EdgeInsets.symmetric(vertical: 4),
                        child: Center(
                            child: SizedBox(
                          width: 500,
                          child: Column(children: [
                            Expanded(
                                flex: 1,
                                child: Text(character.name, style: nameStyle)),
                            Expanded(
                                flex: 4,
                                child: Padding(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 24),
                                    child: Column(children: [
                                      _FieldRow("Species", character.species),
                                      _FieldRow("Type", (character.type.isNotEmpty ? character.type : "not specified")),
                                      _FieldRow("Origin", character.origin),
                                      const Text("Episodes", style: episodesHeaderStyle),
                                      const SizedBox(height: 10),
                                      Expanded(child: ListView.builder(
                                          itemCount: episodes.length,
                                          itemBuilder: ((context, index) {
                                        Episode episode = episodes[index];
                                        return Row(children: [
                                          Text(
                                              "[${episode.code}] ${episode.name}")
                                        ]);
                                      })))
                                    ]))),
                          ]),
                        ))))
              ]);
            } else {
              throw Exception("Unknown state");
            }
          },
        ));
  }
}

class _FieldRow extends StatelessWidget {
  static const TextStyle headerStyle =
      TextStyle(fontSize: 18, color: Color.fromARGB(255, 87, 87, 87));
  static const TextStyle fieldStyle = TextStyle(fontSize: 18);
  final String header;
  final String field;

  const _FieldRow(this.header, this.field, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
      Text("$header:", style: headerStyle),
      Text(field, style: fieldStyle)
    ]);
  }
}
