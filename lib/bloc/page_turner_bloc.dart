import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:rick_and_morty/models/character.dart';
import 'package:rick_and_morty/models/page.dart';
import 'package:rick_and_morty/page_fetcher/page_fetcher.dart';

part 'page_turner_event.dart';
part 'page_turner_state.dart';

class PageTurnerBloc<T> extends Bloc<PageTurnerEvent, PageTurnerState> {
  final PageFetcher<T> pageFetcher;
  Page<T>? currentPage;
  
  PageTurnerBloc(this.pageFetcher) : super(LoadingPage()) {
    on<PageTurnerInit>((event, emit) {
      pageFetcher.fetchPage(1).then(
        (page) {
          currentPage = page;
          add(PageLoaded(page));
        },
        onError: (error) => add(PageFetchingError())
      );
    });
    on<PageLoaded<T>>((event, emit) {
      emit(PageShowing<T>(event.page));
    });
    on<PageFetchingError>((event, emit) {
      emit(PageError());
    });
    on<NextButtonPressed>((event, emit) {
      
    });
  }
}
