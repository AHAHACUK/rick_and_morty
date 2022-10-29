import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'content_loader_event.dart';
part 'content_loader_state.dart';

class ContentLoaderBloc<T> extends Bloc<ContentLoaderEvent, ContentLoaderState> {
  final Future<T?> Function() fetcher;
  ContentLoaderBloc(this.fetcher) : super(NoContent()) {
    on<ContentLoadInit>((event, emit) async {
      T? content = await fetcher();
      if (content != null) {
        emit(ContentLoaded<T>(content));
      }
      else {
        emit(LoadingError());
      }
    });
  }
}
