import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:rick_and_morty/bloc/content_loader_bloc.dart';
import 'package:rick_and_morty/models/character.dart';
import 'package:rick_and_morty/models/content_page.dart';
import 'package:rick_and_morty/fetchers/page_fetcher/page_fetcher.dart';

part 'page_loader_event.dart';

class PageLoaderBloc<T> extends ContentLoaderBloc<ContentPage<T>> {
  final PageFetcher<T> pageFetcher;
  int pageNumber = 1;
  @override
  Future<ContentPage<T>?> Function() get fetcher => () => pageFetcher.fetchPage(pageNumber);
  
  PageLoaderBloc(this.pageFetcher) : super() {
    on<PageOrdered>((event, emit) {
      pageNumber = event.pageNumber;
      add(ContentLoadInit());
    });
  }
}
