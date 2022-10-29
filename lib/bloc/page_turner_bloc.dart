import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:rick_and_morty/models/character.dart';
import 'package:rick_and_morty/models/page.dart';
import 'package:rick_and_morty/fetchers/page_fetcher/page_fetcher.dart';

part 'page_turner_event.dart';
part 'page_turner_state.dart';

class PageTurnerBloc<T> extends Bloc<PageTurnerEvent, PageTurnerState> {
  final PageFetcher<T> pageFetcher;
  Page<T>? currentPage;
  
  PageTurnerBloc(this.pageFetcher) : super(LoadingPage()) {
    on<PageTurnerInit>((event, emit) async {
      Page<T>? page = await pageFetcher.fetchPage(1);
      if (page != null) {
        emit(PageShowing(page));
      }
      else {
        emit(PageError());
      }
    });
    on<NextButtonPressed>((event, emit) {
      
    });
  }
}
