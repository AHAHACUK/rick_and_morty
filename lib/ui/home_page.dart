import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rick_and_morty/bloc/content_loader_bloc.dart';
import 'package:rick_and_morty/bloc/page_loader_bloc.dart';
import 'package:rick_and_morty/models/character.dart';
import 'package:rick_and_morty/fetchers/page_fetcher/character_fetcher.dart';
import 'package:rick_and_morty/models/content_page.dart';
import 'package:rick_and_morty/ui/card_list.dart';
import 'package:rick_and_morty/ui/page_navigator/page_navigator.dart';
import 'package:rick_and_morty/ui/page_navigator/page_navigator_placeholder.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    PageLoaderBloc<Character> pageTurnerBloc =
        PageLoaderBloc(CharacterFetcher());
    pageTurnerBloc.add(ContentLoadInit());
    return Scaffold(
        appBar: AppBar(),
        body: Column(children: [
          SizedBox(
            width: 300,
            child: BlocBuilder<ContentLoaderBloc, ContentLoaderState>(
                bloc: pageTurnerBloc,
                builder: (context, state) {
                  if (state is ContentLoaded<ContentPage<Character>>) {
                    ContentPage<Character> page = state.content;
                    return PageNavigator(page, (newPage) => pageTurnerBloc.add(PageOrdered(newPage)));
                  } else if (state is LoadingError) {
                    return const PageNavigatorPlaceholder();
                  } else if (state is NoContent) {
                    return const PageNavigatorPlaceholder();
                  } else {
                    throw Exception("Unknown state");
                  }
                }),
          ),
          Expanded(
            child: BlocBuilder<ContentLoaderBloc, ContentLoaderState>(
                bloc: pageTurnerBloc,
                builder: (context, state) {
                  if (state is ContentLoaded<ContentPage<Character>>) {
                    ContentPage<Character> page = state.content;
                    return CharacterCardList(page.items);
                  } else if (state is LoadingError) {
                    return const Text('woops');
                  } else if (state is NoContent) {
                    return const Text("Loading...");
                  } else {
                    throw Exception("Unknown state");
                  }
                }),
          )
        ]));
  }
}
