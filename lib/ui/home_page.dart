import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rick_and_morty/bloc/page_turner_bloc.dart';
import 'package:rick_and_morty/models/character.dart';
import 'package:rick_and_morty/page_fetcher/character_fetcher.dart';
import 'package:rick_and_morty/ui/card_list.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    PageTurnerBloc<Character> pageTurnerBloc = PageTurnerBloc(CharacterFetcher());
    pageTurnerBloc.add(PageTurnerInit());
    return Scaffold(
      appBar: AppBar(
        title: const Text(''),
      ),
      body: BlocBuilder<PageTurnerBloc<Character>, PageTurnerState>(
        bloc: pageTurnerBloc,
        builder: (context, state) {
          if (state is PageShowing<Character>) {
            return CharacterCardList(state.page.items);
          }
          else if (state is PageError) {
            return const Text('woops');
          }
          else if (state is LoadingPage) {
            return const Text("Loading...");
          }
          else {
            throw Exception("Unknown state");
          }
        },
      )
    );
  }
}